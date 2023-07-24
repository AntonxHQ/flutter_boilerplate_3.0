import 'package:antonx_flutter_boilerplate_3/models/user_models/auth_response_model.dart';
import 'package:antonx_flutter_boilerplate_3/responses/base_responses/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;
  AuthResponseModel? authResponseModel;

  /// Default constructor
  AuthResponse(success, {error}) : super(success, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    //if (json['body'] != null) accessToken = json['body']['token'];
    if (json['body'] != null) {
      authResponseModel = AuthResponseModel.fromJson(json['body']);
    }
    accessToken = authResponseModel?.token;
  }
}
