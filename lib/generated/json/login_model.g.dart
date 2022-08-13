import 'package:arsip/data/model/login_model.dart';
import 'package:arsip/data/model/user_model.dart';
import 'package:arsip/generated/json/base/json_convert_content.dart';


LoginModel $LoginModelFromJson(Map<String, dynamic> json) {
	final LoginModel loginModel = LoginModel();
	final String? jwt = jsonConvert.convert<String>(json['jwt']);
	if (jwt != null) {
		loginModel.jwt = jwt;
	}
	final UserModel? user = jsonConvert.convert<UserModel>(json['user']);
	if (user != null) {
		loginModel.user = user;
	}
	return loginModel;
}

Map<String, dynamic> $LoginModelToJson(LoginModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['jwt'] = entity.jwt;
	data['user'] = entity.user?.toJson();
	return data;
}