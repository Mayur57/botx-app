// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int status;
  String userId;
  String hash;
  String sessionId;
  UserModel({
    this.status,
    this.userId,
    this.hash,
    this.sessionId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    userId: json["user_id"],
    hash: json["hash"],
    sessionId: json["Session_ID"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user_id": userId,
    "hash": hash,
    "Session_ID": sessionId,
  };
}