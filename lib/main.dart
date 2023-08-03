import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/constants/theme.dart';
import 'package:antonx_flutter_boilerplate_3/routes/my.router.dart';
import 'package:antonx_flutter_boilerplate_3/services/config_service.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/error/error_view.dart';
import 'package:flutter/material.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.bottomsheets.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.dialogs.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:stacked/stacked_annotations.dart';

Future<void> main() async {
  final log = getLogger('main');
  WidgetsFlutterBinding.ensureInitialized();
  log.i('@main');
  await setupLocator(
    environment: Environment.test,
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes().lightTheme,
      darkTheme: AppThemes().darkTheme,
      routerConfig: RouterClass().router,
      // routerDelegate: RouterClass().router.routerDelegate,
      // routeInformationParser: RouterClass().router.routeInformationParser,
      // routeInformationProvider: RouterClass().router.routeInformationProvider,

      ///
      builder: (context, widget) {
        ///
        ///'[ErrorWidget.builder]' is a method in Flutter that allows you to customize the appearance of the widget
        ///that is displayed when an error occurs during the rendering of a widget tree.
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          ///custom error view screen
          return ErrorView(errorDetails: errorDetails.exception.toString());
        };
        return widget ?? Container();
      },
    );
  }
}
