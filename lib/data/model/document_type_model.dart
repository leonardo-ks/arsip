import 'dart:convert';

import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/document_type_model.g.dart';

@JsonSerializable()
class DocumentTypeModel {

	List<DocumentTypeDataModel>? data;
  
  DocumentTypeModel();

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) => $DocumentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataModel {

	int? id;
	DocumentTypeDataAttributesModel? attributes;
  
  DocumentTypeDataModel();

  factory DocumentTypeDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesModel {

	String? type;
	String? createdAt;
	String? updatedAt;
	DocumentTypeDataAttributesDocumentsModel? documents;
  
  DocumentTypeDataAttributesModel();

  factory DocumentTypeDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesDocumentsModel {

	List<DocumentTypeDataAttributesDocumentsDataModel>? data;
  
  DocumentTypeDataAttributesDocumentsModel();

  factory DocumentTypeDataAttributesDocumentsModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesDocumentsDataModel {

	int? id;
	DocumentTypeDataAttributesDocumentsDataAttributesModel? attributes;
  
  DocumentTypeDataAttributesDocumentsDataModel();

  factory DocumentTypeDataAttributesDocumentsDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsDataModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesDocumentsDataAttributesModel {

	@JSONField(name: "document_name")
	String? documentName;
	String? createdAt;
	String? updatedAt;
	dynamic detail;
  
  DocumentTypeDataAttributesDocumentsDataAttributesModel();

  factory DocumentTypeDataAttributesDocumentsDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}