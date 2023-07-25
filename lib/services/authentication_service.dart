import 'package:antonx_flutter_boilerplate_3/app/app.dialogs.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/models/auth_models/login_body.dart';
import 'package:antonx_flutter_boilerplate_3/models/auth_models/signup_body.dart';
import 'package:antonx_flutter_boilerplate_3/models/user.dart';
import 'package:antonx_flutter_boilerplate_3/responses/auth_response.dart';
import 'package:antonx_flutter_boilerplate_3/responses/user_profile_response.dart';
import 'package:antonx_flutter_boilerplate_3/services/database_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/device_info_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/local_storage_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/notification_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService {
  late bool isLogin;
  final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  final _dialogService = locator<DialogService>();
  UserProfile? userProfile;
  String? fcmToken;
  static final log = getLogger('AuthService');

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      log.d('User is already logged-in');
      await _getUserProfile();
      await _updateFcmToken();
    } else {
      log.d('@doSetup: User is not logged-in');
    }
  }

  _getUserProfile() async {
    UserProfileResponse response = await _dbService.getUserProfile();
    if (response.success) {
      userProfile = response.profile;
      log.d('Got User Data: ${userProfile?.toJson()}');
    } else {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Title',
        description: response.error,
      );
    }
  }

  ///
  /// Updating FCM Token here...
  ///
  _updateFcmToken() async {
    final fcmToken = await locator<NotificationService>().getFcmToken();
    final deviceId = await DeviceInfoService().getDeviceId();
    if (deviceId != null) {
      final response = await _dbService.updateFcmToken(deviceId, fcmToken!);
      if (response.success) {
        userProfile!.fcmToken = fcmToken;
      }
    }
  }

  signupWithEmailAndPassword(SignUpBody body) async {
    late AuthResponse response;
    response = await _dbService.createAccount(body);
    if (response.success) {
      userProfile = UserProfile.fromJson(body.toJson());
      _localStorageService.accessToken = response.accessToken;
      await _updateFcmToken();
    }
    return response;
  }

  loginWithEmailAndPassword(LoginBody body) async {
    late AuthResponse response;
    response = await _dbService.loginWithEmailAndPassword(body);
    if (response.success) {
      _localStorageService.accessToken = response.accessToken;
      await _getUserProfile();
      _updateFcmToken();
    }
    return response;
  }

  // resetPassword(ResetPasswordBody body) async {
  //   final AuthResponse response = await _dbService.resetPassword(body);
  //   if (response.success) {
  //     _localStorageService.accessToken = response.accessToken;
  //   }
  //   return response;
  // }

  signupWithApple() {}

  signupWithGmail() {}

  signupWithFacebook() {}

  logout() async {
    isLogin = false;
    userProfile = null;
    String? deviceId = await DeviceInfoService().getDeviceId();

    if (deviceId != null) {
      await _dbService.clearFcmToken(deviceId);
      _localStorageService.accessToken = null;
    } else {
      log.e('@logout Error: Device ID is null');
    }
  }
}
