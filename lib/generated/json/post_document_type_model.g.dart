import 'package:arsip/data/model/post_document_type_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

PostDocumentTypeModel $PostDocumentTypeModelFromJson(Map<String, dynamic> json) {
	final PostDocumentTypeModel postDocumentTypeModel = PostDocumentTypeModel();
	final PostDocumentTypeDataModel? data = jsonConvert.convert<PostDocumentTypeDataModel>(json['data']);
	if (data != null) {
		postDocumentTypeModel.data = data;
	}
	return postDocumentTypeModel;
}

Map<String, dynamic> $PostDocumentTypeModelToJson(PostDocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

PostDocumentTypeDataModel $PostDocumentTypeDataModelFromJson(Map<String, dynamic> json) {
	final PostDocumentTypeDataModel postDocumentTypeDataModel = PostDocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		postDocumentTypeDataModel.id = id;
	}
	final PostDocumentTypeDataAttributesModel? attributes = jsonConvert.convert<PostDocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		postDocumentTypeDataModel.attributes = attributes;
	}
	return postDocumentTypeDataModel;
}

Map<String, dynamic> $PostDocumentTypeDataModelToJson(PostDocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

PostDocumentTypeDataAttributesModel $PostDocumentTypeDataAttributesModelFromJson(Map<String, dynamic> json) {
	final PostDocumentTypeDataAttributesModel postDocumentTypeDataAttributesModel = PostDocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		postDocumentTypeDataAttributesModel.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		postDocumentTypeDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		postDocumentTypeDataAttributesModel.updatedAt = updatedAt;
	}
	return postDocumentTypeDataAttributesModel;
}

Map<String, dynamic> $PostDocumentTypeDataAttributesModelToJson(PostDocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}