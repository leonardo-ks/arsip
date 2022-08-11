import 'dart:convert';

import 'package:arsip/generated/json/user_model.g.dart';

import '../../generated/json/base/json_field.dart';

@JsonSerializable()
class UserModel {

  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => $UserModelFromJson(json);

  Map<String, dynamic> toJson() => $UserModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}