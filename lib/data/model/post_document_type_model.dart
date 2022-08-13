import 'dart:convert';

import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/post_document_type_model.g.dart';

@JsonSerializable()
class PostDocumentTypeModel {

	PostDocumentTypeDataModel? data;

  PostDocumentTypeModel();

  factory PostDocumentTypeModel.fromJson(Map<String, dynamic> json) => $PostDocumentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => $PostDocumentTypeModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PostDocumentTypeDataModel {

	int? id;
	PostDocumentTypeDataAttributesModel? attributes;
  
  PostDocumentTypeDataModel();

  factory PostDocumentTypeDataModel.fromJson(Map<String, dynamic> json) => $PostDocumentTypeDataModelFromJson(json);

  Map<String, dynamic> toJson() => $PostDocumentTypeDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PostDocumentTypeDataAttributesModel {

	String? type;
	String? createdAt;
	String? updatedAt;
  
  PostDocumentTypeDataAttributesModel();

  factory PostDocumentTypeDataAttributesModel.fromJson(Map<String, dynamic> json) => $PostDocumentTypeDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $PostDocumentTypeDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}