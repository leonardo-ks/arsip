import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/document_type_model_entity.dart';

DocumentTypesModel $DocumentTypesModelFromJson(Map<String, dynamic> json) {
	final DocumentTypesModel documentTypesModel = DocumentTypesModel();
	final List<DocumentTypesDataModel>? data = jsonConvert.convertListNotNull<DocumentTypesDataModel>(json['data']);
	if (data != null) {
		documentTypesModel.data = data;
	}
	return documentTypesModel;
}

Map<String, dynamic> $DocumentTypesModelToJson(DocumentTypesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentTypesDataModel $DocumentTypesDataModelFromJson(Map<String, dynamic> json) {
	final DocumentTypesDataModel documentTypesDataModel = DocumentTypesDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypesDataModel.id = id;
	}
	final DocumentTypesDataAttributesModel? attributes = jsonConvert.convert<DocumentTypesDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypesDataModel.attributes = attributes;
	}
	return documentTypesDataModel;
}

Map<String, dynamic> $DocumentTypesDataModelToJson(DocumentTypesDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypesDataAttributesModel $DocumentTypesDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentTypesDataAttributesModel documentTypesDataAttributesModel = DocumentTypesDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentTypesDataAttributesModel.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypesDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypesDataAttributesModel.updatedAt = updatedAt;
	}
	return documentTypesDataAttributesModel;
}

Map<String, dynamic> $DocumentTypesDataAttributesModelToJson(DocumentTypesDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}