import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/document_type_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class DocumentTypeModel {

	List<DocumentTypeDataModel>? data;

  DocumentTypeModel();

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) => $DocumentTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeEntityToJson(this);

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

  factory DocumentTypeDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataToJson(this);

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
	@JSONField(name: "users_permissions_user")
	DocumentTypeDataAttributesUsersPermissionsUserModel? usersPermissionsUser;
	DocumentTypeDataAttributesDocumentsModel? documents;
  
  DocumentTypeDataAttributesModel();

  factory DocumentTypeDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesUsersPermissionsUserModel {

	DocumentTypeDataAttributesUsersPermissionsUserDataModel? data;
  
  DocumentTypeDataAttributesUsersPermissionsUserModel();

  factory DocumentTypeDataAttributesUsersPermissionsUserModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesUsersPermissionsUserFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesUsersPermissionsUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesUsersPermissionsUserDataModel {

	int? id;
	DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel? attributes;
  
  DocumentTypeDataAttributesUsersPermissionsUserDataModel();

  factory DocumentTypeDataAttributesUsersPermissionsUserDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesUsersPermissionsUserDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesUsersPermissionsUserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel {

	String? username;
	String? email;
	String? provider;
	bool? confirmed;
	bool? blocked;
	String? createdAt;
	String? updatedAt;
  
  DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel();

  factory DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesUsersPermissionsUserDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesUsersPermissionsUserDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentTypeDataAttributesDocumentsModel {

	List<DocumentTypeDataAttributesDocumentsDataModel>? data;
  
  DocumentTypeDataAttributesDocumentsModel();

  factory DocumentTypeDataAttributesDocumentsModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsToJson(this);

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

  factory DocumentTypeDataAttributesDocumentsDataModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsDataToJson(this);

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

  factory DocumentTypeDataAttributesDocumentsDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentTypeDataAttributesDocumentsDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentTypeDataAttributesDocumentsDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}