import 'package:antonx_flutter_boilerplate_3/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:antonx_flutter_boilerplate_3/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/home/home_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:antonx_flutter_boilerplate_3/services/local_storage_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/api_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/authentication_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/database_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/date_time_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/location_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/localization_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/config_service.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: DateTimeService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: LocalizationService),
    LazySingleton(classType: ConfigService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
