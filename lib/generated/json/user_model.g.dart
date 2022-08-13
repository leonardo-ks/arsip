import 'package:arsip/data/model/user_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';

UserModel $UserModelFromJson(Map<String, dynamic> json) {
	final UserModel userModel = UserModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userModel.id = id;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userModel.username = username;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userModel.email = email;
	}
	final String? provider = jsonConvert.convert<String>(json['provider']);
	if (provider != null) {
		userModel.provider = provider;
	}
	final bool? confirmed = jsonConvert.convert<bool>(json['confirmed']);
	if (confirmed != null) {
		userModel.confirmed = confirmed;
	}
	final bool? blocked = jsonConvert.convert<bool>(json['blocked']);
	if (blocked != null) {
		userModel.blocked = blocked;
	}
	final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
	if (createdAt != null) {
		userModel.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
	if (updatedAt != null) {
		userModel.updatedAt = updatedAt;
	}
	return userModel;
}

Map<String, dynamic> $UserModelToJson(UserModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['provider'] = entity.provider;
	data['confirmed'] = entity.confirmed;
	data['blocked'] = entity.blocked;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	return data;
}