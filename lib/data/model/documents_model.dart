import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/documents_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DocumentsModel {

	List<DocumentsDataModel>? data;

  DocumentsModel();

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => $DocumentsModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelEntityToJson(this);

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

  factory DocumentsDataModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataToJson(this);

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
	@JSONField(name: "document_type")
	DocumentsDataAttributesDocumentTypeModel? documentType;
  
  DocumentsDataAttributesModel();

  factory DocumentsDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentModel {

	List<DocumentsDataAttributesAttachmentDataModel>? data;
  
  DocumentsDataAttributesAttachmentModel();

  factory DocumentsDataAttributesAttachmentModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesAttachmentFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesAttachmentToJson(this);

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

  factory DocumentsDataAttributesAttachmentDataModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesAttachmentDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesAttachmentDataToJson(this);

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

  factory DocumentsDataAttributesAttachmentDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesAttachmentDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesAttachmentDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesAttachmentDataAttributesFormatsModel {

	DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail? thumbnail;
  
  DocumentsDataAttributesAttachmentDataAttributesFormatsModel();

  factory DocumentsDataAttributesAttachmentDataAttributesFormatsModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesAttachmentDataAttributesFormatsFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesAttachmentDataAttributesFormatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail {

	String? ext;
	String? url;
	String? hash;
	String? mime;
	String? name;
	dynamic path;
	double? size;
	int? width;
	int? height;
  
  DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail();

  factory DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnailFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DocumentsDataAttributesDocumentTypeModel {

	DocumentsDataAttributesDocumentTypeDataModel? data;
  
  DocumentsDataAttributesDocumentTypeModel();

  factory DocumentsDataAttributesDocumentTypeModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesDocumentTypeFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesDocumentTypeToJson(this);

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

  factory DocumentsDataAttributesDocumentTypeDataModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesDocumentTypeDataFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesDocumentTypeDataToJson(this);

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

  factory DocumentsDataAttributesDocumentTypeDataAttributesModel.fromJson(Map<String, dynamic> json) => $DocumentsModelDataAttributesDocumentTypeDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => $DocumentsModelDataAttributesDocumentTypeDataAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}