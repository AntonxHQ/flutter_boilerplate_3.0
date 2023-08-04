// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/api_service.dart';
import '../services/authentication_service.dart';
import '../services/config_service.dart';
import '../services/database_service.dart';
import '../services/date_time_service.dart';
import '../services/device_info_service.dart';
import '../services/file_picker_service.dart';
import '../services/local_storage_service.dart';
import '../services/localization_service.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => DateTimeService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => LocalizationService());
  locator.registerLazySingleton(() => ConfigService(
        environment ?? Environment.test,
      ));
  locator.registerLazySingleton(() => DeviceInfoService());
  locator.registerLazySingleton(() => NotificationService());
  locator.registerLazySingleton(() => FilePickerService());
}
