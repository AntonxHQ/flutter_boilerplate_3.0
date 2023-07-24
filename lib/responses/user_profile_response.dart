import 'package:antonx_flutter_boilerplate_3/models/user.dart';
import 'package:antonx_flutter_boilerplate_3/responses/base_responses/base_response.dart';

class UserProfileResponse extends BaseResponse {
  UserProfile? profile;

  UserProfileResponse(success, {error}) : super(success, error: error);

  UserProfileResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) {
      profile = UserProfile.fromJson(json['body']['user']);
    }
  }
}
