import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/documents_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DocumentsModel {

	List<DocumentsDataModel>? data;

  DocumentsModel();

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => $DocumentsEntityFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataModel {

	int? id;
	DocumentsDataAttributesModel? attributes;
  
  DocumentsDataModel();

  factory DocumentsDataModel.fromJson(Map<String, dynamic> json) => $DocumentsDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesModel {

	@JSONField(name: "document_name")
	String? documentName;
	String? createdAt;
	String? updatedAt;
	dynamic detail;
	DocumentsDataAttributesAttachmentModel? attachment;
	@JSONField(name: "users_permissions_user")
	DocumentsDataAttributesUsersPermissionsUserModel? usersPermissionsUser;
	@JSONField(name: "document_type")
	DocumentsDataAttributesDocumentTypeModel? documentType;
  
  DocumentsDataAttributesModel();

  factory DocumentsDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentModel {

	List<DocumentsDataAttributesAttachmentDataModel>? data;
  
  DocumentsDataAttributesAttachmentModel();

  factory DocumentsDataAttributesAttachmentModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesAttachmentFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesAttachmentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentDataModel {

	int? id;
	DocumentsDataAttributesAttachmentDataAttributesModel? attributes;
  
  DocumentsDataAttributesAttachmentDataModel();

  factory DocumentsDataAttributesAttachmentDataModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesAttachmentDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesAttachmentDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentDataAttributesModel {

	String? name;
	String? alternativeText;
	String? caption;
	int? width;
	int? height;
	DocumentsDataAttributesAttachmentDataAttributesFormatsModel? formats;
	String? hash;
	String? ext;
	String? mime;
	double? size;
	String? url;
	dynamic previewUrl;
	String? provider;
	@JSONField(name: "provider_metadata")
	dynamic providerMetadata;
	String? createdAt;
	String? updatedAt;
  
  DocumentsDataAttributesAttachmentDataAttributesModel();

  factory DocumentsDataAttributesAttachmentDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesAttachmentDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesAttachmentDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentDataAttributesFormatsModel {

	DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel? thumbnail;
  
  DocumentsDataAttributesAttachmentDataAttributesFormatsModel();

  factory DocumentsDataAttributesAttachmentDataAttributesFormatsModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesAttachmentDataAttributesFormatsFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesAttachmentDataAttributesFormatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel {

	String? ext;
	String? url;
	String? hash;
	String? mime;
	String? name;
	dynamic path;
	double? size;
	int? width;
	int? height;
  
  DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel();

  factory DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesUsersPermissionsUserModel {

	DocumentsDataAttributesUsersPermissionsUserDataModel? data;
  
  DocumentsDataAttributesUsersPermissionsUserModel();

  factory DocumentsDataAttributesUsersPermissionsUserModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesUsersPermissionsUserFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesUsersPermissionsUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesUsersPermissionsUserDataModel {

	int? id;
	DocumentsDataAttributesUsersPermissionsUserDataAttributesModel? attributes;
  
  DocumentsDataAttributesUsersPermissionsUserDataModel();

  factory DocumentsDataAttributesUsersPermissionsUserDataModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesUsersPermissionsUserDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesUsersPermissionsUserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesUsersPermissionsUserDataAttributesModel {

	String? username;
	String? email;
	String? provider;
	bool? confirmed;
	bool? blocked;
	String? createdAt;
	String? updatedAt;
  
  DocumentsDataAttributesUsersPermissionsUserDataAttributesModel();

  factory DocumentsDataAttributesUsersPermissionsUserDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesUsersPermissionsUserDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesUsersPermissionsUserDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesDocumentTypeModel {

	DocumentsDataAttributesDocumentTypeDataModel? data;
  
  DocumentsDataAttributesDocumentTypeModel();

  factory DocumentsDataAttributesDocumentTypeModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesDocumentTypeFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesDocumentTypeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesDocumentTypeDataModel {

	int? id;
	DocumentsDataAttributesDocumentTypeDataAttributesModel? attributes;
  
  DocumentsDataAttributesDocumentTypeDataModel();

  factory DocumentsDataAttributesDocumentTypeDataModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesDocumentTypeDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesDocumentTypeDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesDocumentTypeDataAttributesModel {

	String? type;
	String? createdAt;
	String? updatedAt;
  
  DocumentsDataAttributesDocumentTypeDataAttributesModel();

  factory DocumentsDataAttributesDocumentTypeDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsDataAttributesDocumentTypeDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsDataAttributesDocumentTypeDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}