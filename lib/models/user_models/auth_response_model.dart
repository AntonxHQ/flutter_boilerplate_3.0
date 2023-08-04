class AuthResponseModel {
  Customer? customer;
  String? token;
  String? firebaseLoginToken;

  AuthResponseModel({this.customer, this.token});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    token = json['token'];
    firebaseLoginToken = json['firebase_custom_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['token'] = token;
    data['firebase_custom_token'] = firebaseLoginToken;
    return data;
  }
}

class Customer {
  int? id;
  int? userId;
  int? status;
  String? phoneNumber;
  String? profileImage;
  User? user;

  Customer(
      {this.id,
      this.userId,
      this.status,
      this.phoneNumber,
      this.profileImage,
      this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    phoneNumber = json['phone_number'];
    profileImage = json['profile_image'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status'] = status;
    data['phone_number'] = phoneNumber;
    data['profile_image'] = profileImage;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? firebaseUid;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.firebaseUid,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firebaseUid = json['firebase_uid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['firebase_uid'] = firebaseUid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
