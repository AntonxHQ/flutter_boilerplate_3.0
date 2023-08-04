import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/constants/theme.dart';
import 'package:antonx_flutter_boilerplate_3/routes/my.router.dart';
import 'package:antonx_flutter_boilerplate_3/services/config_service.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/error/error_view.dart';
import 'package:flutter/material.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.bottomsheets.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.dialogs.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

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
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemes().lightTheme,
          darkTheme: AppThemes().darkTheme,
          routerConfig: AppRouter().router,
          builder: (context, child) {
            ///
            ///'[ErrorWidget.builder]' is a method in Flutter that allows you to customize the appearance of the widget
            ///that is displayed when an error occurs during the rendering of a widget tree.
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              ///custom error view screen
              return ErrorView(errorDetails: errorDetails.exception.toString());
            };

            return AccessibilityTools(
              // *Set to null to disable tap area checking
              minimumTapAreas: MinimumTapAreas.material,
              checkSemanticLabels: true,
              // *Check for flex overflows
              checkFontOverflows: true,
              child: child,
            );
          }),
    );
  }
}
