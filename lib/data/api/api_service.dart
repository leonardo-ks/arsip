import 'dart:convert';
import 'dart:developer';
import 'package:arsip/data/model/document_type_model_entity.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/login_model.dart';
import 'package:arsip/data/model/user_model.dart';
import 'package:arsip/data/shared_preferences/shared_preferences_services.dart';

import 'api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel?> login(String identifier, String password) async {
    UserModel? model;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      Map data = {
        'identifier': identifier,
        'password': password
      };
      var body = json.encode(data);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body,
      );
      LoginModel? responseJson = LoginModel.fromJson(json.decode(response.body));
      if (responseJson.jwt != null) {
        await SharedPreferencesService().addString('jwt', '${responseJson.jwt}');
        model = responseJson.user;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<UserModel?> register(String username, String email, String password) async {
    UserModel? model;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint);
      Map data = {
        'username': username,
        'email': email,
        'password': password
      };
      var body = json.encode(data);
      var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      LoginModel? responseJson = LoginModel.fromJson(json.decode(response.body));
      if (responseJson.jwt != null) {
        model = responseJson.user;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<UserModel?> getUserInfo() async{
    String? bearer;
    UserModel? model;
    await SharedPreferencesService().getString('jwt').then((value) => bearer = 'Bearer $value');
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.profileEndpoint);
      var response = await http.get(url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        model = UserModel.fromJson(json.decode(response.body));
      }
      return model;
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<List<DocumentsDataModel>?> getDocuments() async{
    String? bearer;
    List<DocumentsDataModel>? model;
    await SharedPreferencesService().getString('jwt').then((value) => bearer = 'Bearer $value');
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.documentsEndpoint}?populate=*');
      var response = await http.get(url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel = DocumentsModel.fromJson(json.decode(response.body));
        model = responseModel.data;
      }
      return model;
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<List<DocumentTypesDataModel>?> getDocumentTypes() async{
    String? bearer;
    List<DocumentTypesDataModel>? model;
    await SharedPreferencesService().getString('jwt').then((value) => bearer = 'Bearer $value');
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.documentTypesEndpoint);
      var response = await http.get(url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel = DocumentTypesModel.fromJson(json.decode(response.body));
        model = responseModel.data;
        log(model.toString());
      }
      return model;
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
}