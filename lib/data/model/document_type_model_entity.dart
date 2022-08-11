import 'package:arsip/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:arsip/generated/json/document_type_model_entity.g.dart';

@JsonSerializable()
class DocumentTypesModel {

	List<DocumentTypesDataModel>? data;

  DocumentTypesModel();

  factory DocumentTypesModel.fromJson(Map<String, dynamic> json) => $DocumentTypesModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypesDataModel {

	int? id;
	DocumentTypesDataAttributesModel? attributes;
  
  DocumentTypesDataModel();

  factory DocumentTypesDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypesDataModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypesDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypesDataAttributesModel {

	String? type;
	String? createdAt;
	String? updatedAt;
  
  DocumentTypesDataAttributesModel();

  factory DocumentTypesDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypesDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypesDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}