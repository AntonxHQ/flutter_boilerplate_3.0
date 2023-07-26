import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/services/config_service.dart';
import 'package:flutter/material.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.bottomsheets.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.dialogs.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.router.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  final log = getLogger('main');
  WidgetsFlutterBinding.ensureInitialized();
  log.i('@main');
  await setupLocator(
    environment: Environment.prod,
  );

  log.i('get base user ${locator<ConfigService>().baseUrl}');

  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => AccessibilityTools(
        // *Set to null to disable tap area checking
        minimumTapAreas: MinimumTapAreas.material,
        checkSemanticLabels: false,
        // *Check for flex overflows
        checkFontOverflows: true,
        child: child,
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
