import 'package:arsip/data/model/upload_file_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

UploadFileModel $UploadFileEntityFromJson(Map<String, dynamic> json) {
	final UploadFileModel uploadFileEntity = UploadFileModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		uploadFileEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileEntity.name = name;
	}
	final dynamic? alternativeText = jsonConvert.convert<dynamic>(json['alternativeText']);
	if (alternativeText != null) {
		uploadFileEntity.alternativeText = alternativeText;
	}
	final dynamic? caption = jsonConvert.convert<dynamic>(json['caption']);
	if (caption != null) {
		uploadFileEntity.caption = caption;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileEntity.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileEntity.height = height;
	}
	final UploadFileFormatsModel? formats = jsonConvert.convert<UploadFileFormatsModel>(json['formats']);
	if (formats != null) {
		uploadFileEntity.formats = formats;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileEntity.hash = hash;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileEntity.ext = ext;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileEntity.mime = mime;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileEntity.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileEntity.url = url;
	}
	final dynamic? previewUrl = jsonConvert.convert<dynamic>(json['previewUrl']);
	if (previewUrl != null) {
		uploadFileEntity.previewUrl = previewUrl;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		uploadFileEntity.provider = provider;
	}
	final dynamic? providerMetadata = jsonConvert.convert<dynamic>(json['provider_metadata']);
	if (providerMetadata != null) {
		uploadFileEntity.providerMetadata = providerMetadata;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		uploadFileEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		uploadFileEntity.updatedAt = updatedAt;
	}
	return uploadFileEntity;
}

Map<String, dynamic> $UploadFileEntityToJson(UploadFileModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
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

UploadFileFormatsModel $UploadFileFormatsFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsModel uploadFileFormats = UploadFileFormatsModel();
	final UploadFileFormatsSmallModel? small = jsonConvert.convert<UploadFileFormatsSmallModel>(json['small']);
	if (small != null) {
		uploadFileFormats.small = small;
	}
	final UploadFileFormatsThumbnailModel? thumbnail = jsonConvert.convert<UploadFileFormatsThumbnailModel>(json['thumbnail']);
	if (thumbnail != null) {
		uploadFileFormats.thumbnail = thumbnail;
	}
	return uploadFileFormats;
}

Map<String, dynamic> $UploadFileFormatsToJson(UploadFileFormatsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['small'] = entity.small?.toJson();
	data['thumbnail'] = entity.thumbnail?.toJson();
	return data;
}

UploadFileFormatsSmallModel $UploadFileFormatsSmallFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsSmallModel uploadFileFormatsSmall = UploadFileFormatsSmallModel();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileFormatsSmall.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileFormatsSmall.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileFormatsSmall.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileFormatsSmall.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileFormatsSmall.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		uploadFileFormatsSmall.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileFormatsSmall.size = size;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileFormatsSmall.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileFormatsSmall.height = height;
	}
	return uploadFileFormatsSmall;
}

Map<String, dynamic> $UploadFileFormatsSmallToJson(UploadFileFormatsSmallModel entity) {
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

UploadFileFormatsThumbnailModel $UploadFileFormatsThumbnailFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsThumbnailModel uploadFileFormatsThumbnail = UploadFileFormatsThumbnailModel();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileFormatsThumbnail.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileFormatsThumbnail.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileFormatsThumbnail.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileFormatsThumbnail.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileFormatsThumbnail.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		uploadFileFormatsThumbnail.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileFormatsThumbnail.size = size;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileFormatsThumbnail.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileFormatsThumbnail.height = height;
	}
	return uploadFileFormatsThumbnail;
}

Map<String, dynamic> $UploadFileFormatsThumbnailToJson(UploadFileFormatsThumbnailModel entity) {
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