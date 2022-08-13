import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

DocumentsModel $DocumentsModelFromJson(Map<String, dynamic> json) {
	final DocumentsModel documentsModel = DocumentsModel();
	final List<DocumentsDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataModel>(json['data']);
	if (data != null) {
		documentsModel.data = data;
	}
	return documentsModel;
}

Map<String, dynamic> $DocumentsModelToJson(DocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataModel $DocumentsDataModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataModel documentsDataModel = DocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataModel.id = id;
	}
	final DocumentsDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataModel.attributes = attributes;
	}
	return documentsDataModel;
}

Map<String, dynamic> $DocumentsDataModelToJson(DocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesModel $DocumentsDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesModel documentsDataAttributesModel = DocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		documentsDataAttributesModel.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesModel.updatedAt = updatedAt;
	}
	final dynamic? detail = jsonConvert.convert<dynamic>(json['detail']);
	if (detail != null) {
		documentsDataAttributesModel.detail = detail;
	}
	final DocumentsDataAttributesAttachmentModel? attachment = jsonConvert.convert<DocumentsDataAttributesAttachmentModel>(json['attachment']);
	if (attachment != null) {
		documentsDataAttributesModel.attachment = attachment;
	}
	final DocumentsDataAttributesDocumentTypeModel? documentType = jsonConvert.convert<DocumentsDataAttributesDocumentTypeModel>(json['document_type']);
	if (documentType != null) {
		documentsDataAttributesModel.documentType = documentType;
	}
	return documentsDataAttributesModel;
}

Map<String, dynamic> $DocumentsDataAttributesModelToJson(DocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	data['attachment'] = entity.attachment?.toJson();
	data['document_type'] = entity.documentType?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentModel $DocumentsDataAttributesAttachmentModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentModel documentsDataAttributesAttachmentModel = DocumentsDataAttributesAttachmentModel();
	final List<DocumentsDataAttributesAttachmentDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataAttributesAttachmentDataModel>(json['data']);
	if (data != null) {
		documentsDataAttributesAttachmentModel.data = data;
	}
	return documentsDataAttributesAttachmentModel;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentModelToJson(DocumentsDataAttributesAttachmentModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataAttributesAttachmentDataModel $DocumentsDataAttributesAttachmentDataModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataModel documentsDataAttributesAttachmentDataModel = DocumentsDataAttributesAttachmentDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataAttributesAttachmentDataModel.id = id;
	}
	final DocumentsDataAttributesAttachmentDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataAttributesAttachmentDataModel.attributes = attributes;
	}
	return documentsDataAttributesAttachmentDataModel;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataModelToJson(DocumentsDataAttributesAttachmentDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentDataAttributesModel $DocumentsDataAttributesAttachmentDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesModel documentsDataAttributesAttachmentDataAttributesModel = DocumentsDataAttributesAttachmentDataAttributesModel();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		documentsDataAttributesAttachmentDataAttributesModel.name = name;
	}
	final String? alternativeText = jsonConvert.convert<String>(json['alternativeText']);
	if (alternativeText != null) {
		documentsDataAttributesAttachmentDataAttributesModel.alternativeText = alternativeText;
	}
	final String? caption = jsonConvert.convert<String>(json['caption']);
	if (caption != null) {
		documentsDataAttributesAttachmentDataAttributesModel.caption = caption;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		documentsDataAttributesAttachmentDataAttributesModel.width = width;
	}
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		documentsDataAttributesAttachmentDataAttributesModel.height = height;
	}
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel? formats = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesFormatsModel>(json['formats']);
	if (formats != null) {
		documentsDataAttributesAttachmentDataAttributesModel.formats = formats;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		documentsDataAttributesAttachmentDataAttributesModel.hash = hash;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		documentsDataAttributesAttachmentDataAttributesModel.ext = ext;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		documentsDataAttributesAttachmentDataAttributesModel.mime = mime;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		documentsDataAttributesAttachmentDataAttributesModel.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		documentsDataAttributesAttachmentDataAttributesModel.url = url;
	}
	final dynamic? previewUrl = jsonConvert.convert<dynamic>(json['previewUrl']);
	if (previewUrl != null) {
		documentsDataAttributesAttachmentDataAttributesModel.previewUrl = previewUrl;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		documentsDataAttributesAttachmentDataAttributesModel.provider = provider;
	}
	final dynamic? providerMetadata = jsonConvert.convert<dynamic>(json['provider_metadata']);
	if (providerMetadata != null) {
		documentsDataAttributesAttachmentDataAttributesModel.providerMetadata = providerMetadata;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesAttachmentDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesAttachmentDataAttributesModel.updatedAt = updatedAt;
	}
	return documentsDataAttributesAttachmentDataAttributesModel;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataAttributesModelToJson(DocumentsDataAttributesAttachmentDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['alternativeText'] = entity.alternativeText;
	data['caption'] = entity.caption;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['formats'] = entity.formats?.toJson();
	data['hash'] = entity.hash;
	data['ext'] = entity.ext;
	data['mime'] = entity.mime;
	data['size'] = entity.size;
	data['url'] = entity.url;
	data['previewUrl'] = entity.previewUrl;
	data['provider'] = entity.provider;
	data['provider_metadata'] = entity.providerMetadata;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}

DocumentsDataAttributesAttachmentDataAttributesFormatsModel $DocumentsDataAttributesAttachmentDataAttributesFormatsModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel documentsDataAttributesAttachmentDataAttributesFormatsModel = DocumentsDataAttributesAttachmentDataAttributesFormatsModel();
	final DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail? thumbnail = jsonConvert.convert<DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail>(json['thumbnail']);
	if (thumbnail != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsModel.thumbnail = thumbnail;
	}
	return documentsDataAttributesAttachmentDataAttributesFormatsModel;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataAttributesFormatsModelToJson(DocumentsDataAttributesAttachmentDataAttributesFormatsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['thumbnail'] = entity.thumbnail?.toJson();
	return data;
}

DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail $DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnailFromJson(Map<String, dynamic> json) {
	final DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail = DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.size = size;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.width = width;
	}
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.height = height;
	}
	return documentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail;
}

Map<String, dynamic> $DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnailToJson(DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ext'] = entity.ext;
	data['url'] = entity.url;
	data['hash'] = entity.hash;
	data['mime'] = entity.mime;
	data['name'] = entity.name;
	data['path'] = entity.path;
	data['size'] = entity.size;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}

DocumentsDataAttributesDocumentTypeModel $DocumentsDataAttributesDocumentTypeModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeModel documentsDataAttributesDocumentTypeModel = DocumentsDataAttributesDocumentTypeModel();
	final DocumentsDataAttributesDocumentTypeDataModel? data = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataModel>(json['data']);
	if (data != null) {
		documentsDataAttributesDocumentTypeModel.data = data;
	}
	return documentsDataAttributesDocumentTypeModel;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeModelToJson(DocumentsDataAttributesDocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataModel $DocumentsDataAttributesDocumentTypeDataModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataModel documentsDataAttributesDocumentTypeDataModel = DocumentsDataAttributesDocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataAttributesDocumentTypeDataModel.id = id;
	}
	final DocumentsDataAttributesDocumentTypeDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataAttributesDocumentTypeDataModel.attributes = attributes;
	}
	return documentsDataAttributesDocumentTypeDataModel;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeDataModelToJson(DocumentsDataAttributesDocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataAttributesModel $DocumentsDataAttributesDocumentTypeDataAttributesModelFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataAttributesModel documentsDataAttributesDocumentTypeDataAttributesModel = DocumentsDataAttributesDocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentsDataAttributesDocumentTypeDataAttributesModel.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesDocumentTypeDataAttributesModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesDocumentTypeDataAttributesModel.updatedAt = updatedAt;
	}
	return documentsDataAttributesDocumentTypeDataAttributesModel;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeDataAttributesModelToJson(DocumentsDataAttributesDocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}