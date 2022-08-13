import 'package:arsip/generated/json/base/json_convert_content.dart';
import 'package:arsip/data/model/error_model.dart';

ErrorModel $ErrorModelFromJson(Map<String, dynamic> json) {
	final ErrorModel errorModel = ErrorModel();
	final dynamic? data = jsonConvert.convert<dynamic>(json['data']);
	if (data != null) {
		errorModel.data = data;
	}
	final ErrorDataModel? error = jsonConvert.convert<ErrorDataModel>(json['error']);
	if (error != null) {
		errorModel.error = error;
	}
	return errorModel;
}

Map<String, dynamic> $ErrorModelToJson(ErrorModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data;
	data['error'] = entity.error?.toJson();
	return data;
}

ErrorDataModel $ErrorDataModelFromJson(Map<String, dynamic> json) {
	final ErrorDataModel errorDataModel = ErrorDataModel();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		errorDataModel.status = status;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		errorDataModel.name = name;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		errorDataModel.message = message;
	}
	return errorDataModel;
}

Map<String, dynamic> $ErrorDataModelToJson(ErrorDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['name'] = entity.name;
	data['message'] = entity.message;
	return data;
}