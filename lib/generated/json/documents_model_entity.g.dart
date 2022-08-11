import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/documents_model.dart';

DocumentsModel $DocumentsModelEntityFromJson(Map<String, dynamic> json) {
	final DocumentsModel documentsModelEntity = DocumentsModel();
	final List<DocumentsDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataModel>(json['data']);
	if (data != null) {
		documentsModelEntity.data = data;
	}
	return documentsModelEntity;
}

Map<String, dynamic> $DocumentsModelEntityToJson(DocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataModel $DocumentsModelDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataModel documentsModelData = DocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsModelData.id = id;
	}
	final DocumentsDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsModelData.attributes = attributes;
	}
	return documentsModelData;
}

Map<String, dynamic> $DocumentsModelDataToJson(DocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesModel $DocumentsModelDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesModel documentsModelDataAttributes = DocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		documentsModelDataAttributes.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsModelDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsModelDataAttributes.updatedAt = updatedAt;
	}
	final dynamic? detail = jsonConvert.convert<dynamic>(json['detail']);
	if (detail != null) {
		documentsModelDataAttributes.detail = detail;
	}
	final DocumentsDataAttributesAttachmentModel? attachment = jsonConvert.convert<DocumentsDataAttributesAttachmentModel>(json['attachment']);
	if (attachment != null) {
		documentsModelDataAttributes.attachment = attachment;
	}
	final DocumentsDataAttributesDocumentTypeModel? documentType = jsonConvert.convert<DocumentsDataAttributesDocumentTypeModel>(json['document_type']);
	if (documentType != null) {
		documentsModelDataAttributes.documentType = documentType;
	}
	return documentsModelDataAttributes;
}

Map<String, dynamic> $DocumentsModelDataAttributesToJson(DocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	data['attachment'] = entity.attachment?.toJson();
	data['document_type'] = entity.documentType?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentModel $DocumentsModelDataAttributesAttachmentFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentModel documentsModelDataAttributesAttachment = DocumentsDataAttributesAttachmentModel();
	final List<DocumentsDataAttributesAttachmentDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataAttributesAttachmentDataModel>(json['data']);
	if (data != null) {
		documentsModelDataAttributesAttachment.data = data;
	}
	return documentsModelDataAttributesAttachment;
}

Map<String, dynamic> $DocumentsModelDataAttributesAttachmentToJson(DocumentsDataAttributesAttachmentModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataAttributesAttachmentDataModel $DocumentsModelDataAttributesAttachmentDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataModel documentsModelDataAttributesAttachmentData = DocumentsDataAttributesAttachmentDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsModelDataAttributesAttachmentData.id = id;
	}
	final DocumentsDataAttributesAttachmentDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsModelDataAttributesAttachmentData.attributes = attributes;
	}
	return documentsModelDataAttributesAttachmentData;
}

Map<String, dynamic> $DocumentsModelDataAttributesAttachmentDataToJson(DocumentsDataAttributesAttachmentDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentDataAttributesModel $DocumentsModelDataAttributesAttachmentDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesModel documentsModelDataAttributesAttachmentDataAttributes = DocumentsDataAttributesAttachmentDataAttributesModel();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		documentsModelDataAttributesAttachmentDataAttributes.name = name;
	}
	final String? alternativeText = jsonConvert.convert<String>(json['alternativeText']);
	if (alternativeText != null) {
		documentsModelDataAttributesAttachmentDataAttributes.alternativeText = alternativeText;
	}
	final String? caption = jsonConvert.convert<String>(json['caption']);
	if (caption != null) {
		documentsModelDataAttributesAttachmentDataAttributes.caption = caption;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		documentsModelDataAttributesAttachmentDataAttributes.width = width;
	}
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		documentsModelDataAttributesAttachmentDataAttributes.height = height;
	}
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel? formats = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesFormatsModel>(json['formats']);
	if (formats != null) {
		documentsModelDataAttributesAttachmentDataAttributes.formats = formats;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		documentsModelDataAttributesAttachmentDataAttributes.hash = hash;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		documentsModelDataAttributesAttachmentDataAttributes.ext = ext;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		documentsModelDataAttributesAttachmentDataAttributes.mime = mime;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		documentsModelDataAttributesAttachmentDataAttributes.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		documentsModelDataAttributesAttachmentDataAttributes.url = url;
	}
	final dynamic? previewUrl = jsonConvert.convert<dynamic>(json['previewUrl']);
	if (previewUrl != null) {
		documentsModelDataAttributesAttachmentDataAttributes.previewUrl = previewUrl;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		documentsModelDataAttributesAttachmentDataAttributes.provider = provider;
	}
	final dynamic? providerMetadata = jsonConvert.convert<dynamic>(json['provider_metadata']);
	if (providerMetadata != null) {
		documentsModelDataAttributesAttachmentDataAttributes.providerMetadata = providerMetadata;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsModelDataAttributesAttachmentDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsModelDataAttributesAttachmentDataAttributes.updatedAt = updatedAt;
	}
	return documentsModelDataAttributesAttachmentDataAttributes;
}

Map<String, dynamic> $DocumentsModelDataAttributesAttachmentDataAttributesToJson(DocumentsDataAttributesAttachmentDataAttributesModel entity) {
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

DocumentsDataAttributesAttachmentDataAttributesFormatsModel $DocumentsModelDataAttributesAttachmentDataAttributesFormatsFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel documentsModelDataAttributesAttachmentDataAttributesFormats = DocumentsDataAttributesAttachmentDataAttributesFormatsModel();
	final DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail? thumbnail = jsonConvert.convert<DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail>(json['thumbnail']);
	if (thumbnail != null) {
		documentsModelDataAttributesAttachmentDataAttributesFormats.thumbnail = thumbnail;
	}
	return documentsModelDataAttributesAttachmentDataAttributesFormats;
}

Map<String, dynamic> $DocumentsModelDataAttributesAttachmentDataAttributesFormatsToJson(DocumentsDataAttributesAttachmentDataAttributesFormatsModel entity) {
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

DocumentsDataAttributesDocumentTypeModel $DocumentsModelDataAttributesDocumentTypeFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeModel documentsModelDataAttributesDocumentType = DocumentsDataAttributesDocumentTypeModel();
	final DocumentsDataAttributesDocumentTypeDataModel? data = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataModel>(json['data']);
	if (data != null) {
		documentsModelDataAttributesDocumentType.data = data;
	}
	return documentsModelDataAttributesDocumentType;
}

Map<String, dynamic> $DocumentsModelDataAttributesDocumentTypeToJson(DocumentsDataAttributesDocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataModel $DocumentsModelDataAttributesDocumentTypeDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataModel documentsModelDataAttributesDocumentTypeData = DocumentsDataAttributesDocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsModelDataAttributesDocumentTypeData.id = id;
	}
	final DocumentsDataAttributesDocumentTypeDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsModelDataAttributesDocumentTypeData.attributes = attributes;
	}
	return documentsModelDataAttributesDocumentTypeData;
}

Map<String, dynamic> $DocumentsModelDataAttributesDocumentTypeDataToJson(DocumentsDataAttributesDocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataAttributesModel $DocumentsModelDataAttributesDocumentTypeDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataAttributesModel documentsModelDataAttributesDocumentTypeDataAttributes = DocumentsDataAttributesDocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentsModelDataAttributesDocumentTypeDataAttributes.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsModelDataAttributesDocumentTypeDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsModelDataAttributesDocumentTypeDataAttributes.updatedAt = updatedAt;
	}
	return documentsModelDataAttributesDocumentTypeDataAttributes;
}

Map<String, dynamic> $DocumentsModelDataAttributesDocumentTypeDataAttributesToJson(DocumentsDataAttributesDocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}