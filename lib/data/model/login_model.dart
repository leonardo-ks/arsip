import 'package:arsip/data/model/user_model.dart';
import 'package:arsip/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:arsip/generated/json/login_model.g.dart';

@JsonSerializable()
class LoginModel {

	String? jwt;
	UserModel? user;

  LoginModel();

  factory LoginModel.fromJson(Map<String, dynamic> json) => $LoginModelFromJson(json);

  Map<String, dynamic> toJson() => $LoginModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}