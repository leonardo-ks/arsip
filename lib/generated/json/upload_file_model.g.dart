import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/upload_file_model.dart';

UploadFileModel $UploadFileModelFromJson(Map<String, dynamic> json) {
	final UploadFileModel uploadFileModel = UploadFileModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		uploadFileModel.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileModel.name = name;
	}
	final dynamic? alternativeText = jsonConvert.convert<dynamic>(json['alternativeText']);
	if (alternativeText != null) {
		uploadFileModel.alternativeText = alternativeText;
	}
	final dynamic? caption = jsonConvert.convert<dynamic>(json['caption']);
	if (caption != null) {
		uploadFileModel.caption = caption;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileModel.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileModel.height = height;
	}
	final UploadFileFormatsModel? formats = jsonConvert.convert<UploadFileFormatsModel>(json['formats']);
	if (formats != null) {
		uploadFileModel.formats = formats;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileModel.hash = hash;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileModel.ext = ext;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileModel.mime = mime;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileModel.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileModel.url = url;
	}
	final dynamic? previewUrl = jsonConvert.convert<dynamic>(json['previewUrl']);
	if (previewUrl != null) {
		uploadFileModel.previewUrl = previewUrl;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		uploadFileModel.provider = provider;
	}
	final dynamic? providerMetadata = jsonConvert.convert<dynamic>(json['provider_metadata']);
	if (providerMetadata != null) {
		uploadFileModel.providerMetadata = providerMetadata;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		uploadFileModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		uploadFileModel.updatedAt = updatedAt;
	}
	return uploadFileModel;
}

Map<String, dynamic> $UploadFileModelToJson(UploadFileModel entity) {
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

UploadFileFormatsModel $UploadFileFormatsModelFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsModel uploadFileFormatsModel = UploadFileFormatsModel();
	final UploadFileFormatsSmallModel? small = jsonConvert.convert<UploadFileFormatsSmallModel>(json['small']);
	if (small != null) {
		uploadFileFormatsModel.small = small;
	}
	final UploadFileFormatsThumbnailModel? thumbnail = jsonConvert.convert<UploadFileFormatsThumbnailModel>(json['thumbnail']);
	if (thumbnail != null) {
		uploadFileFormatsModel.thumbnail = thumbnail;
	}
	return uploadFileFormatsModel;
}

Map<String, dynamic> $UploadFileFormatsModelToJson(UploadFileFormatsModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['small'] = entity.small?.toJson();
	data['thumbnail'] = entity.thumbnail?.toJson();
	return data;
}

UploadFileFormatsSmallModel $UploadFileFormatsSmallModelFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsSmallModel uploadFileFormatsSmallModel = UploadFileFormatsSmallModel();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileFormatsSmallModel.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileFormatsSmallModel.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileFormatsSmallModel.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileFormatsSmallModel.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileFormatsSmallModel.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		uploadFileFormatsSmallModel.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileFormatsSmallModel.size = size;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileFormatsSmallModel.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileFormatsSmallModel.height = height;
	}
	return uploadFileFormatsSmallModel;
}

Map<String, dynamic> $UploadFileFormatsSmallModelToJson(UploadFileFormatsSmallModel entity) {
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

UploadFileFormatsThumbnailModel $UploadFileFormatsThumbnailModelFromJson(Map<String, dynamic> json) {
	final UploadFileFormatsThumbnailModel uploadFileFormatsThumbnailModel = UploadFileFormatsThumbnailModel();
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		uploadFileFormatsThumbnailModel.ext = ext;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		uploadFileFormatsThumbnailModel.url = url;
	}
	final String? hash = jsonConvert.convert<String>(json['hash']);
	if (hash != null) {
		uploadFileFormatsThumbnailModel.hash = hash;
	}
	final String? mime = jsonConvert.convert<String>(json['mime']);
	if (mime != null) {
		uploadFileFormatsThumbnailModel.mime = mime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		uploadFileFormatsThumbnailModel.name = name;
	}
	final dynamic? path = jsonConvert.convert<dynamic>(json['path']);
	if (path != null) {
		uploadFileFormatsThumbnailModel.path = path;
	}
	final double? size = jsonConvert.convert<double>(json['size']);
	if (size != null) {
		uploadFileFormatsThumbnailModel.size = size;
	}
	final double? width = jsonConvert.convert<double>(json['width']);
	if (width != null) {
		uploadFileFormatsThumbnailModel.width = width;
	}
	final double? height = jsonConvert.convert<double>(json['height']);
	if (height != null) {
		uploadFileFormatsThumbnailModel.height = height;
	}
	return uploadFileFormatsThumbnailModel;
}

Map<String, dynamic> $UploadFileFormatsThumbnailModelToJson(UploadFileFormatsThumbnailModel entity) {
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