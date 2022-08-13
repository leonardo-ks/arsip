import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/document_type_model.dart';

DocumentTypeModel $DocumentTypeEntityFromJson(Map<String, dynamic> json) {
	final DocumentTypeModel documentTypeEntity = DocumentTypeModel();
	final List<DocumentTypeDataModel>? data = jsonConvert.convertListNotNull<DocumentTypeDataModel>(json['data']);
	if (data != null) {
		documentTypeEntity.data = data;
	}
	return documentTypeEntity;
}

Map<String, dynamic> $DocumentTypeEntityToJson(DocumentTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentTypeDataModel $DocumentTypeDataFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataModel documentTypeData = DocumentTypeDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypeData.id = id;
	}
	final DocumentTypeDataAttributesModel? attributes = jsonConvert.convert<DocumentTypeDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypeData.attributes = attributes;
	}
	return documentTypeData;
}

Map<String, dynamic> $DocumentTypeDataToJson(DocumentTypeDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypeDataAttributesModel $DocumentTypeDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesModel documentTypeDataAttributes = DocumentTypeDataAttributesModel();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		documentTypeDataAttributes.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypeDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypeDataAttributes.updatedAt = updatedAt;
	}
	final DocumentTypeDataAttributesUsersPermissionsUserModel? usersPermissionsUser = jsonConvert.convert<DocumentTypeDataAttributesUsersPermissionsUserModel>(json['users_permissions_user']);
	if (usersPermissionsUser != null) {
		documentTypeDataAttributes.usersPermissionsUser = usersPermissionsUser;
	}
	final DocumentTypeDataAttributesDocumentsModel? documents = jsonConvert.convert<DocumentTypeDataAttributesDocumentsModel>(json['documents']);
	if (documents != null) {
		documentTypeDataAttributes.documents = documents;
	}
	return documentTypeDataAttributes;
}

Map<String, dynamic> $DocumentTypeDataAttributesToJson(DocumentTypeDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['users_permissions_user'] = entity.usersPermissionsUser?.toJson();
	data['documents'] = entity.documents?.toJson();
	return data;
}

DocumentTypeDataAttributesUsersPermissionsUserModel $DocumentTypeDataAttributesUsersPermissionsUserFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesUsersPermissionsUserModel documentTypeDataAttributesUsersPermissionsUser = DocumentTypeDataAttributesUsersPermissionsUserModel();
	final DocumentTypeDataAttributesUsersPermissionsUserDataModel? data = jsonConvert.convert<DocumentTypeDataAttributesUsersPermissionsUserDataModel>(json['data']);
	if (data != null) {
		documentTypeDataAttributesUsersPermissionsUser.data = data;
	}
	return documentTypeDataAttributesUsersPermissionsUser;
}

Map<String, dynamic> $DocumentTypeDataAttributesUsersPermissionsUserToJson(DocumentTypeDataAttributesUsersPermissionsUserModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DocumentTypeDataAttributesUsersPermissionsUserDataModel $DocumentTypeDataAttributesUsersPermissionsUserDataFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesUsersPermissionsUserDataModel documentTypeDataAttributesUsersPermissionsUserData = DocumentTypeDataAttributesUsersPermissionsUserDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypeDataAttributesUsersPermissionsUserData.id = id;
	}
	final DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel? attributes = jsonConvert.convert<DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypeDataAttributesUsersPermissionsUserData.attributes = attributes;
	}
	return documentTypeDataAttributesUsersPermissionsUserData;
}

Map<String, dynamic> $DocumentTypeDataAttributesUsersPermissionsUserDataToJson(DocumentTypeDataAttributesUsersPermissionsUserDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel $DocumentTypeDataAttributesUsersPermissionsUserDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel documentTypeDataAttributesUsersPermissionsUserDataAttributes = DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.username = username;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.email = email;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.provider = provider;
	}
	final bool? confirmed = jsonConvert.convert<bool>(json['confirmed']);
	if (confirmed != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.confirmed = confirmed;
	}
	final bool? blocked = jsonConvert.convert<bool>(json['blocked']);
	if (blocked != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.blocked = blocked;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypeDataAttributesUsersPermissionsUserDataAttributes.updatedAt = updatedAt;
	}
	return documentTypeDataAttributesUsersPermissionsUserDataAttributes;
}

Map<String, dynamic> $DocumentTypeDataAttributesUsersPermissionsUserDataAttributesToJson(DocumentTypeDataAttributesUsersPermissionsUserDataAttributesModel entity) {
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

DocumentTypeDataAttributesDocumentsModel $DocumentTypeDataAttributesDocumentsFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsModel documentTypeDataAttributesDocuments = DocumentTypeDataAttributesDocumentsModel();
	final List<DocumentTypeDataAttributesDocumentsDataModel>? data = jsonConvert.convertListNotNull<DocumentTypeDataAttributesDocumentsDataModel>(json['data']);
	if (data != null) {
		documentTypeDataAttributesDocuments.data = data;
	}
	return documentTypeDataAttributesDocuments;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsToJson(DocumentTypeDataAttributesDocumentsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DocumentTypeDataAttributesDocumentsDataModel $DocumentTypeDataAttributesDocumentsDataFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsDataModel documentTypeDataAttributesDocumentsData = DocumentTypeDataAttributesDocumentsDataModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		documentTypeDataAttributesDocumentsData.id = id;
	}
	final DocumentTypeDataAttributesDocumentsDataAttributesModel? attributes = jsonConvert.convert<DocumentTypeDataAttributesDocumentsDataAttributesModel>(json['attributes']);
	if (attributes != null) {
		documentTypeDataAttributesDocumentsData.attributes = attributes;
	}
	return documentTypeDataAttributesDocumentsData;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsDataToJson(DocumentTypeDataAttributesDocumentsDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

DocumentTypeDataAttributesDocumentsDataAttributesModel $DocumentTypeDataAttributesDocumentsDataAttributesFromJson(Map<String, dynamic> json) {
	final DocumentTypeDataAttributesDocumentsDataAttributesModel documentTypeDataAttributesDocumentsDataAttributes = DocumentTypeDataAttributesDocumentsDataAttributesModel();
	final String? documentName = jsonConvert.convert<String>(json['document_name']);
	if (documentName != null) {
		documentTypeDataAttributesDocumentsDataAttributes.documentName = documentName;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		documentTypeDataAttributesDocumentsDataAttributes.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		documentTypeDataAttributesDocumentsDataAttributes.updatedAt = updatedAt;
	}
	final dynamic? detail = jsonConvert.convert<dynamic>(json['detail']);
	if (detail != null) {
		documentTypeDataAttributesDocumentsDataAttributes.detail = detail;
	}
	return documentTypeDataAttributesDocumentsDataAttributes;
}

Map<String, dynamic> $DocumentTypeDataAttributesDocumentsDataAttributesToJson(DocumentTypeDataAttributesDocumentsDataAttributesModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['document_name'] = entity.documentName;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['detail'] = entity.detail;
	return data;
}