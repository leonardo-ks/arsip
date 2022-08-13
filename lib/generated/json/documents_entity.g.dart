import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/documents_model.dart';

DocumentsModel $DocumentsEntityFromJson(Map<String, dynamic> json) {
	final DocumentsModel documentsEntity = DocumentsModel();
	final List<DocumentsDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataModel>(json['data']);
	if (data != null) {
		documentsEntity.data = data;
	}
	return documentsEntity;
}

Map<String, dynamic> $DocumentsEntityToJson(DocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataModel $DocumentsDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataModel documentsData = DocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsData.id = id;
	}
	final DocumentsDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsData.attributes = attributes;
	}
	return documentsData;
}

Map<String, dynamic> $DocumentsDataToJson(DocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesModel $DocumentsDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesModel documentsDataAttributes = DocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		documentsDataAttributes.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributes.updatedAt = updatedAt;
	}
	final dynamic? detail = jsonConvert.convert<dynamic>(json['detail']);
	if (detail != null) {
		documentsDataAttributes.detail = detail;
	}
	final DocumentsDataAttributesAttachmentModel? attachment = jsonConvert.convert<DocumentsDataAttributesAttachmentModel>(json['attachment']);
	if (attachment != null) {
		documentsDataAttributes.attachment = attachment;
	}
	final DocumentsDataAttributesUsersPermissionsUserModel? usersPermissionsUser = jsonConvert.convert<DocumentsDataAttributesUsersPermissionsUserModel>(json['users_permissions_user']);
	if (usersPermissionsUser != null) {
		documentsDataAttributes.usersPermissionsUser = usersPermissionsUser;
	}
	final DocumentsDataAttributesDocumentTypeModel? documentType = jsonConvert.convert<DocumentsDataAttributesDocumentTypeModel>(json['document_type']);
	if (documentType != null) {
		documentsDataAttributes.documentType = documentType;
	}
	return documentsDataAttributes;
}

Map<String, dynamic> $DocumentsDataAttributesToJson(DocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	data['attachment'] = entity.attachment?.toJson();
	data['users_permissions_user'] = entity.usersPermissionsUser?.toJson();
	data['document_type'] = entity.documentType?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentModel $DocumentsDataAttributesAttachmentFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentModel documentsDataAttributesAttachment = DocumentsDataAttributesAttachmentModel();
	final List<DocumentsDataAttributesAttachmentDataModel>? data = jsonConvert.convertListNotNull<DocumentsDataAttributesAttachmentDataModel>(json['data']);
	if (data != null) {
		documentsDataAttributesAttachment.data = data;
	}
	return documentsDataAttributesAttachment;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentToJson(DocumentsDataAttributesAttachmentModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentsDataAttributesAttachmentDataModel $DocumentsDataAttributesAttachmentDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataModel documentsDataAttributesAttachmentData = DocumentsDataAttributesAttachmentDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataAttributesAttachmentData.id = id;
	}
	final DocumentsDataAttributesAttachmentDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataAttributesAttachmentData.attributes = attributes;
	}
	return documentsDataAttributesAttachmentData;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataToJson(DocumentsDataAttributesAttachmentDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentDataAttributesModel $DocumentsDataAttributesAttachmentDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesModel documentsDataAttributesAttachmentDataAttributes = DocumentsDataAttributesAttachmentDataAttributesModel();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		documentsDataAttributesAttachmentDataAttributes.name = name;
	}
	final String? alternativeText = jsonConvert.convert<String>(json['alternativeText']);
	if (alternativeText != null) {
		documentsDataAttributesAttachmentDataAttributes.alternativeText = alternativeText;
	}
	final String? caption = jsonConvert.convert<String>(json['caption']);
	if (caption != null) {
		documentsDataAttributesAttachmentDataAttributes.caption = caption;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		documentsDataAttributesAttachmentDataAttributes.width = width;
	}
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		documentsDataAttributesAttachmentDataAttributes.height = height;
	}
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel? formats = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesFormatsModel>(json['formats']);
	if (formats != null) {
		documentsDataAttributesAttachmentDataAttributes.formats = formats;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		documentsDataAttributesAttachmentDataAttributes.hash = hash;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		documentsDataAttributesAttachmentDataAttributes.ext = ext;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		documentsDataAttributesAttachmentDataAttributes.mime = mime;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		documentsDataAttributesAttachmentDataAttributes.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		documentsDataAttributesAttachmentDataAttributes.url = url;
	}
	final dynamic? previewUrl = jsonConvert.convert<dynamic>(json['previewUrl']);
	if (previewUrl != null) {
		documentsDataAttributesAttachmentDataAttributes.previewUrl = previewUrl;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		documentsDataAttributesAttachmentDataAttributes.provider = provider;
	}
	final dynamic? providerMetadata = jsonConvert.convert<dynamic>(json['provider_metadata']);
	if (providerMetadata != null) {
		documentsDataAttributesAttachmentDataAttributes.providerMetadata = providerMetadata;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesAttachmentDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesAttachmentDataAttributes.updatedAt = updatedAt;
	}
	return documentsDataAttributesAttachmentDataAttributes;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataAttributesToJson(DocumentsDataAttributesAttachmentDataAttributesModel entity) {
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

DocumentsDataAttributesAttachmentDataAttributesFormatsModel $DocumentsDataAttributesAttachmentDataAttributesFormatsFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesFormatsModel documentsDataAttributesAttachmentDataAttributesFormats = DocumentsDataAttributesAttachmentDataAttributesFormatsModel();
	final DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel? thumbnail = jsonConvert.convert<DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel>(json['thumbnail']);
	if (thumbnail != null) {
		documentsDataAttributesAttachmentDataAttributesFormats.thumbnail = thumbnail;
	}
	return documentsDataAttributesAttachmentDataAttributesFormats;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataAttributesFormatsToJson(DocumentsDataAttributesAttachmentDataAttributesFormatsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['thumbnail'] = entity.thumbnail?.toJson();
	return data;
}

DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel $DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel documentsDataAttributesAttachmentDataAttributesFormatsThumbnail = DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.size = size;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.width = width;
	}
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		documentsDataAttributesAttachmentDataAttributesFormatsThumbnail.height = height;
	}
	return documentsDataAttributesAttachmentDataAttributesFormatsThumbnail;
}

Map<String, dynamic> $DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailToJson(DocumentsDataAttributesAttachmentDataAttributesFormatsThumbnailModel entity) {
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

DocumentsDataAttributesUsersPermissionsUserModel $DocumentsDataAttributesUsersPermissionsUserFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesUsersPermissionsUserModel documentsDataAttributesUsersPermissionsUser = DocumentsDataAttributesUsersPermissionsUserModel();
	final DocumentsDataAttributesUsersPermissionsUserDataModel? data = jsonConvert.convert<DocumentsDataAttributesUsersPermissionsUserDataModel>(json['data']);
	if (data != null) {
		documentsDataAttributesUsersPermissionsUser.data = data;
	}
	return documentsDataAttributesUsersPermissionsUser;
}

Map<String, dynamic> $DocumentsDataAttributesUsersPermissionsUserToJson(DocumentsDataAttributesUsersPermissionsUserModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DocumentsDataAttributesUsersPermissionsUserDataModel $DocumentsDataAttributesUsersPermissionsUserDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesUsersPermissionsUserDataModel documentsDataAttributesUsersPermissionsUserData = DocumentsDataAttributesUsersPermissionsUserDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataAttributesUsersPermissionsUserData.id = id;
	}
	final DocumentsDataAttributesUsersPermissionsUserDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesUsersPermissionsUserDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataAttributesUsersPermissionsUserData.attributes = attributes;
	}
	return documentsDataAttributesUsersPermissionsUserData;
}

Map<String, dynamic> $DocumentsDataAttributesUsersPermissionsUserDataToJson(DocumentsDataAttributesUsersPermissionsUserDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesUsersPermissionsUserDataAttributesModel $DocumentsDataAttributesUsersPermissionsUserDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesUsersPermissionsUserDataAttributesModel documentsDataAttributesUsersPermissionsUserDataAttributes = DocumentsDataAttributesUsersPermissionsUserDataAttributesModel();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.username = username;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.email = email;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.provider = provider;
	}
	final bool? confirmed = jsonConvert.convert<bool>(json['confirmed']);
	if (confirmed != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.confirmed = confirmed;
	}
	final bool? blocked = jsonConvert.convert<bool>(json['blocked']);
	if (blocked != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.blocked = blocked;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesUsersPermissionsUserDataAttributes.updatedAt = updatedAt;
	}
	return documentsDataAttributesUsersPermissionsUserDataAttributes;
}

Map<String, dynamic> $DocumentsDataAttributesUsersPermissionsUserDataAttributesToJson(DocumentsDataAttributesUsersPermissionsUserDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['provider'] = entity.provider;
	data['confirmed'] = entity.confirmed;
	data['blocked'] = entity.blocked;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}

DocumentsDataAttributesDocumentTypeModel $DocumentsDataAttributesDocumentTypeFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeModel documentsDataAttributesDocumentType = DocumentsDataAttributesDocumentTypeModel();
	final DocumentsDataAttributesDocumentTypeDataModel? data = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataModel>(json['data']);
	if (data != null) {
		documentsDataAttributesDocumentType.data = data;
	}
	return documentsDataAttributesDocumentType;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeToJson(DocumentsDataAttributesDocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataModel $DocumentsDataAttributesDocumentTypeDataFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataModel documentsDataAttributesDocumentTypeData = DocumentsDataAttributesDocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentsDataAttributesDocumentTypeData.id = id;
	}
	final DocumentsDataAttributesDocumentTypeDataAttributesModel? attributes = jsonConvert.convert<DocumentsDataAttributesDocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentsDataAttributesDocumentTypeData.attributes = attributes;
	}
	return documentsDataAttributesDocumentTypeData;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeDataToJson(DocumentsDataAttributesDocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentsDataAttributesDocumentTypeDataAttributesModel $DocumentsDataAttributesDocumentTypeDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentsDataAttributesDocumentTypeDataAttributesModel documentsDataAttributesDocumentTypeDataAttributes = DocumentsDataAttributesDocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentsDataAttributesDocumentTypeDataAttributes.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentsDataAttributesDocumentTypeDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentsDataAttributesDocumentTypeDataAttributes.updatedAt = updatedAt;
	}
	return documentsDataAttributesDocumentTypeDataAttributes;
}

Map<String, dynamic> $DocumentsDataAttributesDocumentTypeDataAttributesToJson(DocumentsDataAttributesDocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}