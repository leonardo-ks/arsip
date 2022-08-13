import 'dart:convert';

import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/folder_model.g.dart';

@JsonSerializable()
class FolderModel {

	FolderDataModel? data;

  FolderModel();

  factory FolderModel.fromJson(Map<String, dynamic> json) => $FolderModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FolderDataModel {

	int? id;
	FolderDataAttributesModel? attributes;
  
  FolderDataModel();

  factory FolderDataModel.fromJson(Map<String, dynamic> json) => $FolderDataModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FolderDataAttributesModel {

	String? type;
	String? createdAt;
	String? updatedAt;
	FolderDataAttributesDocumentsModel? documents;
  
  FolderDataAttributesModel();

  factory FolderDataAttributesModel.fromJson(Map<String, dynamic> json) => $FolderDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FolderDataAttributesDocumentsModel {

	List<FolderDataAttributesDocumentsDataModel>? data;
  
  FolderDataAttributesDocumentsModel();

  factory FolderDataAttributesDocumentsModel.fromJson(Map<String, dynamic> json) => $FolderDataAttributesDocumentsModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderDataAttributesDocumentsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FolderDataAttributesDocumentsDataModel {

	int? id;
	FolderDataAttributesDocumentsDataAttributesModel? attributes;
  
  FolderDataAttributesDocumentsDataModel();

  factory FolderDataAttributesDocumentsDataModel.fromJson(Map<String, dynamic> json) => $FolderDataAttributesDocumentsDataModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderDataAttributesDocumentsDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FolderDataAttributesDocumentsDataAttributesModel {

	@JSONField(name: "document_name")
	String? documentName;
	String? createdAt;
	String? updatedAt;
	String? detail;
  
  FolderDataAttributesDocumentsDataAttributesModel();

  factory FolderDataAttributesDocumentsDataAttributesModel.fromJson(Map<String, dynamic> json) => $FolderDataAttributesDocumentsDataAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => $FolderDataAttributesDocumentsDataAttributesModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}