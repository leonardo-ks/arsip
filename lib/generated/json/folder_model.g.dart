import 'package:arsip/data/model/folder_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

FolderModel $FolderModelFromJson(Map<String, dynamic> json) {
	final FolderModel folderModel = FolderModel();
	final FolderDataModel? data = jsonConvert.convert<FolderDataModel>(json['data']);
	if (data != null) {
		folderModel.data = data;
	}
	return folderModel;
}

Map<String, dynamic> $FolderModelToJson(FolderModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FolderDataModel $FolderDataModelFromJson(Map<String, dynamic> json) {
	final FolderDataModel folderDataModel = FolderDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		folderDataModel.id = id;
	}
	final FolderDataAttributesModel? attributes = jsonConvert.convert<FolderDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		folderDataModel.attributes = attributes;
	}
	return folderDataModel;
}

Map<String, dynamic> $FolderDataModelToJson(FolderDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

FolderDataAttributesModel $FolderDataAttributesModelFromJson(Map<String, dynamic> json) {
	final FolderDataAttributesModel folderDataAttributesModel = FolderDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		folderDataAttributesModel.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		folderDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		folderDataAttributesModel.updatedAt = updatedAt;
	}
	final FolderDataAttributesDocumentsModel? documents = jsonConvert.convert<FolderDataAttributesDocumentsModel>(json['documents']);
	if (documents != null) {
		folderDataAttributesModel.documents = documents;
	}
	return folderDataAttributesModel;
}

Map<String, dynamic> $FolderDataAttributesModelToJson(FolderDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['documents'] = entity.documents?.toJson();
	return data;
}

FolderDataAttributesDocumentsModel $FolderDataAttributesDocumentsModelFromJson(Map<String, dynamic> json) {
	final FolderDataAttributesDocumentsModel folderDataAttributesDocumentsModel = FolderDataAttributesDocumentsModel();
	final List<FolderDataAttributesDocumentsDataModel>? data = jsonConvert.convertListNotNull<FolderDataAttributesDocumentsDataModel>(json['data']);
	if (data != null) {
		folderDataAttributesDocumentsModel.data = data;
	}
	return folderDataAttributesDocumentsModel;
}

Map<String, dynamic> $FolderDataAttributesDocumentsModelToJson(FolderDataAttributesDocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

FolderDataAttributesDocumentsDataModel $FolderDataAttributesDocumentsDataModelFromJson(Map<String, dynamic> json) {
	final FolderDataAttributesDocumentsDataModel folderDataAttributesDocumentsDataModel = FolderDataAttributesDocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		folderDataAttributesDocumentsDataModel.id = id;
	}
	final FolderDataAttributesDocumentsDataAttributesModel? attributes = jsonConvert.convert<FolderDataAttributesDocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		folderDataAttributesDocumentsDataModel.attributes = attributes;
	}
	return folderDataAttributesDocumentsDataModel;
}

Map<String, dynamic> $FolderDataAttributesDocumentsDataModelToJson(FolderDataAttributesDocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

FolderDataAttributesDocumentsDataAttributesModel $FolderDataAttributesDocumentsDataAttributesModelFromJson(Map<String, dynamic> json) {
	final FolderDataAttributesDocumentsDataAttributesModel folderDataAttributesDocumentsDataAttributesModel = FolderDataAttributesDocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		folderDataAttributesDocumentsDataAttributesModel.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		folderDataAttributesDocumentsDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		folderDataAttributesDocumentsDataAttributesModel.updatedAt = updatedAt;
	}
	final String? detail = jsonConvert.convert<String>(json['detail']);
	if (detail != null) {
		folderDataAttributesDocumentsDataAttributesModel.detail = detail;
	}
	return folderDataAttributesDocumentsDataAttributesModel;
}

Map<String, dynamic> $FolderDataAttributesDocumentsDataAttributesModelToJson(FolderDataAttributesDocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	return data;
}