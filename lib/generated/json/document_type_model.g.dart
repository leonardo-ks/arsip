import 'package:arsip/data/model/document_type_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

DocumentTypeModel $DocumentTypeModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeModel documentTypeModel = DocumentTypeModel();
	final List<DocumentTypeDataModel>? data = jsonConvert.convertListNotNull<DocumentTypeDataModel>(json['data']);
	if (data != null) {
		documentTypeModel.data = data;
	}
	return documentTypeModel;
}

Map<String, dynamic> $DocumentTypeModelToJson(DocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentTypeDataModel $DocumentTypeDataModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataModel documentTypeDataModel = DocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypeDataModel.id = id;
	}
	final DocumentTypeDataAttributesModel? attributes = jsonConvert.convert<DocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypeDataModel.attributes = attributes;
	}
	return documentTypeDataModel;
}

Map<String, dynamic> $DocumentTypeDataModelToJson(DocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypeDataAttributesModel $DocumentTypeDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesModel documentTypeDataAttributesModel = DocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentTypeDataAttributesModel.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypeDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypeDataAttributesModel.updatedAt = updatedAt;
	}
	final DocumentTypeDataAttributesDocumentsModel? documents = jsonConvert.convert<DocumentTypeDataAttributesDocumentsModel>(json['documents']);
	if (documents != null) {
		documentTypeDataAttributesModel.documents = documents;
	}
	return documentTypeDataAttributesModel;
}

Map<String, dynamic> $DocumentTypeDataAttributesModelToJson(DocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['documents'] = entity.documents?.toJson();
	return data;
}

DocumentTypeDataAttributesDocumentsModel $DocumentTypeDataAttributesDocumentsModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsModel documentTypeDataAttributesDocumentsModel = DocumentTypeDataAttributesDocumentsModel();
	final List<DocumentTypeDataAttributesDocumentsDataModel>? data = jsonConvert.convertListNotNull<DocumentTypeDataAttributesDocumentsDataModel>(json['data']);
	if (data != null) {
		documentTypeDataAttributesDocumentsModel.data = data;
	}
	return documentTypeDataAttributesDocumentsModel;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsModelToJson(DocumentTypeDataAttributesDocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentTypeDataAttributesDocumentsDataModel $DocumentTypeDataAttributesDocumentsDataModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsDataModel documentTypeDataAttributesDocumentsDataModel = DocumentTypeDataAttributesDocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypeDataAttributesDocumentsDataModel.id = id;
	}
	final DocumentTypeDataAttributesDocumentsDataAttributesModel? attributes = jsonConvert.convert<DocumentTypeDataAttributesDocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypeDataAttributesDocumentsDataModel.attributes = attributes;
	}
	return documentTypeDataAttributesDocumentsDataModel;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsDataModelToJson(DocumentTypeDataAttributesDocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypeDataAttributesDocumentsDataAttributesModel $DocumentTypeDataAttributesDocumentsDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsDataAttributesModel documentTypeDataAttributesDocumentsDataAttributesModel = DocumentTypeDataAttributesDocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		documentTypeDataAttributesDocumentsDataAttributesModel.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypeDataAttributesDocumentsDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypeDataAttributesDocumentsDataAttributesModel.updatedAt = updatedAt;
	}
	final dynamic? detail = jsonConvert.convert<dynamic>(json['detail']);
	if (detail != null) {
		documentTypeDataAttributesDocumentsDataAttributesModel.detail = detail;
	}
	return documentTypeDataAttributesDocumentsDataAttributesModel;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsDataAttributesModelToJson(DocumentTypeDataAttributesDocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	return data;
}