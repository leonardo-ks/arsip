import 'dart:convert';

import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/error_model.g.dart';

@JsonSerializable()
class ErrorModel {

	dynamic data;
	ErrorDataModel? error;
  
  ErrorModel();

  factory ErrorModel.fromJson(Map<String, dynamic> json) => $ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => $ErrorModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ErrorDataModel {

	int? status;
	String? name;
	String? message;

  ErrorDataModel();

  factory ErrorDataModel.fromJson(Map<String, dynamic> json) => $ErrorDataModelFromJson(json);

  Map<String, dynamic> toJson() => $ErrorDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}