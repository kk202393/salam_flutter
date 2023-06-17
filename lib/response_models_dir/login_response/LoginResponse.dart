import 'dart:convert';
// import 'package:meta/meta.dart';
// import 'dart:developer' as devtools show log;
// import 'package:meta/meta.dart';

// To parse this JSON data, do
//
// final userLoginResponse = userLoginResponseFromJson(jsonString);

UserLoginResponse userLoginResponseFromJson(String str) =>
    UserLoginResponse.fromJson(json.decode(str));

// String userLoginResponseToJson(UserLoginResponse data) =>
//     json.encode(data.toJson());

class UserLoginResponse {
  UserLoginResponse({
    required this.status,
    required this.success,
    required this.msg,
    required this.data,
  });

  final int status;
  final bool success;
  final String msg;
  final Data data;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      UserLoginResponse(
        status: json["status"],
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.userFirstName,
    required this.userLastName,
    required this.userId,
    required this.email,
    required this.isStaff,
  });

  final String userFirstName;
  final String userLastName;
  final int userId;
  final String email;
  final bool isStaff;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userFirstName: json["user_first_name"],
        userLastName: json["user_last_name"],
        userId: json["user_id"],
        email: json["email"],
        isStaff: json["is_staff"],
      );

  Map<String, dynamic> toJson() => {
        "user_first_name": userFirstName,
        "user_last_name": userLastName,
        "user_id": userId,
        "email": email,
        "is_staff": isStaff,
      };
}
