import 'dart:convert';

import 'package:arsip/generated/json/base/json_field.dart';
import 'package:arsip/generated/json/upload_file_model.g.dart';

@JsonSerializable()
class UploadFileModel {

	int? id;
	String? name;
	dynamic alternativeText;
	dynamic caption;
	double? width;
	double? height;
	UploadFileFormatsModel? formats;
	String? hash;
	String? ext;
	String? mime;
	double? size;
	String? url;
	dynamic previewUrl;
	String? provider;
	@JSONField(name: "provider_metadata")
	dynamic providerMetadata;
	String? createdAt;
	String? updatedAt;
  
  UploadFileModel();

  factory UploadFileModel.fromJson(Map<String, dynamic> json) => $UploadFileModelFromJson(json);

  Map<String, dynamic> toJson() => $UploadFileModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UploadFileFormatsModel {

	UploadFileFormatsSmallModel? small;
	UploadFileFormatsThumbnailModel? thumbnail;
  
  UploadFileFormatsModel();

  factory UploadFileFormatsModel.fromJson(Map<String, dynamic> json) => $UploadFileFormatsModelFromJson(json);

  Map<String, dynamic> toJson() => $UploadFileFormatsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UploadFileFormatsSmallModel {

	String? ext;
	String? url;
	String? hash;
	String? mime;
	String? name;
	dynamic path;
	double? size;
	double? width;
	double? height;
  
  UploadFileFormatsSmallModel();

  factory UploadFileFormatsSmallModel.fromJson(Map<String, dynamic> json) => $UploadFileFormatsSmallModelFromJson(json);

  Map<String, dynamic> toJson() => $UploadFileFormatsSmallModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UploadFileFormatsThumbnailModel {

	String? ext;
	String? url;
	String? hash;
	String? mime;
	String? name;
	dynamic path;
	double? size;
	double? width;
	double? height;
  
  UploadFileFormatsThumbnailModel();

  factory UploadFileFormatsThumbnailModel.fromJson(Map<String, dynamic> json) => $UploadFileFormatsThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => $UploadFileFormatsThumbnailModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}