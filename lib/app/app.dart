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
import 'package:antonx_flutter_boilerplate_3/services/device_info_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/notification_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/file_picker_service.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/login/login_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/error/error_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/root/root_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/map/map_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/profile/profile_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/chat/chat_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/conversation/conversation_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/profile_setting/profile_setting_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/detail/detail_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ErrorView),
    // MaterialRoute(page: RootView),
    MaterialRoute(page: MapView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: ConversationView),
    MaterialRoute(page: ProfileSettingView),
    MaterialRoute(page: DetailView),
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
    LazySingleton(classType: DeviceInfoService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: FilePickerService),
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
