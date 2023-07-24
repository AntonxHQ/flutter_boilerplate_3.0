import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/constants/end_points.dart';
import 'package:antonx_flutter_boilerplate_3/models/auth_models/login_body.dart';
import 'package:antonx_flutter_boilerplate_3/models/auth_models/signup_body.dart';
import 'package:antonx_flutter_boilerplate_3/responses/auth_response.dart';
import 'package:antonx_flutter_boilerplate_3/responses/base_responses/base_response.dart';
import 'package:antonx_flutter_boilerplate_3/responses/base_responses/request_response.dart';
import 'package:antonx_flutter_boilerplate_3/responses/user_profile_response.dart';
import 'package:antonx_flutter_boilerplate_3/services/api_service.dart';

class DatabaseService {
  final ApiService _apiServices = locator<ApiService>();

  Future<UserProfileResponse> getUserProfile() async {
    final RequestResponse response =
        await _apiServices.get(endPoint: EndPoints.userProfile);
    return UserProfileResponse.fromJson(response.data);
  }

  Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.fcmToken,
      data: {
        'device_id': deviceId,
        'token': token,
      },
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> clearFcmToken(String deviceId) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.clearFcmToken,
      data: {'device_id': deviceId},
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.login,
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> createAccount(SignUpBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.signup,
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }
}
