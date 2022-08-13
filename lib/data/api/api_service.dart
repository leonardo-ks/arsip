import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:arsip/data/model/document_type_model.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/error_model.dart';
import 'package:arsip/data/model/folder_model.dart';
import 'package:arsip/data/model/login_model.dart';
import 'package:arsip/data/model/post_document_type_model.dart';
import 'package:arsip/data/model/upload_file_model.dart';
import 'package:arsip/data/model/user_model.dart';
import 'package:arsip/data/shared_preferences/shared_preferences_services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'api_constants.dart';

class ApiService {
  Future<dynamic> login(String identifier, String password) async {
    UserModel? model;
    ErrorDataModel? error;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      Map data = {'identifier': identifier, 'password': password};
      var body = json.encode(data);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.body.isNotEmpty) {
        LoginModel? responseModel =
            LoginModel.fromJson(json.decode(response.body));
        if (responseModel.user != null) {
          await SharedPreferencesService()
              .addString('jwt', '${responseModel.jwt}');
          model = responseModel.user;
          await SharedPreferencesService().addInteger('id', model!.id!);
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> register(
      String username, String email, String password) async {
    UserModel? model;
    ErrorDataModel? error;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint);
      Map data = {'username': username, 'email': email, 'password': password};
      var body = json.encode(data);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.body.isNotEmpty) {
        LoginModel? responseModel =
            LoginModel.fromJson(json.decode(response.body));
        if (responseModel.user != null) {
          model = responseModel.user;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
          log(error.toString());
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<UserModel?> getUserInfo() async {
    String? bearer;
    UserModel? model;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getProfileEndpoint);
      var response = await http.get(
        url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel = UserModel.fromJson(json.decode(response.body));
        if (responseModel.id != null) {
          model = responseModel;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<dynamic> updateUserInfo(
      int id, String username, String email, String password) async {
    String? bearer;
    UserModel? model;
    ErrorDataModel? error;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.profileEndpoint}/$id');
      Map data = {'username': username, 'email': email, 'password': password};
      var body = json.encode(data);
      var response = await http.put(
        url,
        headers: {
          'Authorization': '$bearer',
          "Content-Type": "application/json"
        },
        body: body,
      );
      if (response.body.isNotEmpty) {
        UserModel? responseModel =
            UserModel.fromJson(json.decode(response.body));
        if (responseModel.id != null) {
          model = responseModel;
        } else {
          error = ErrorModel.fromJson(jsonDecode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<List<DocumentsDataModel>?> getDocuments() async {
    String? bearer;
    List<DocumentsDataModel>? model;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      final queryParameters = {
        'populate': '*',
      };
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.documentsEndpoint)
          .replace(queryParameters: queryParameters);
      var response = await http.get(
        url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel = DocumentsModel.fromJson(json.decode(response.body));
        model = responseModel.data;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<dynamic> postDocuments(String name, int attachmentId, int? folderId) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    int? userId;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    await SharedPreferencesService()
        .getInteger('id')
        .then((value) => userId = value);
    Map value = {
      'data': {
        'document_name': name,
        'attachment': {
          'id': attachmentId
        },
        'users_permissions_user': {
          'id': userId
        },
        'document_type': {
          'id': folderId
        }
      }
    };
    var body = json.encode(value);
    try {
      var url =
      Uri.parse(ApiConstants.baseUrl + ApiConstants.documentsEndpoint);
      var response = await http.post(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
        body: body,
      );
      if (response.body.isNotEmpty) {
        var responseModel =
        PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> updateDocuments(String name, int id) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    Map value = {
      'data': {
        'document_name': name,
      }
    };
    var body = json.encode(value);
    try {
      var url =
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.documentsEndpoint}/$id');
      var response = await http.put(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
        body: body,
      );
      log(response.body);
      if (response.body.isNotEmpty) {
        var responseModel =
        PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> deleteDocuments(int id) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      var url =
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.documentsEndpoint}/$id');
      var response = await http.delete(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
      );
      if (response.body.isNotEmpty) {
        var responseModel =
        PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> uploadFiles(String path, String name) async {
    String? bearer;
    UploadFileModel? model;
    ErrorDataModel? error;
    File imageFile = File(path);
    int? length;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      await imageFile.length().then((value) => length = value);
      var url =
      Uri.parse(ApiConstants.baseUrl + ApiConstants.uploadFilesEndpoint);
      var request = http.MultipartRequest('POST', url);
      var multipartFile = http.MultipartFile('files', imageFile.readAsBytes().asStream(), length!, filename: name, contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      request.headers['Authorization'] = '$bearer';
      request.headers['Accept'] = 'application/json';
      http.Response response = await http.Response.fromStream(await request.send());
      String value = "a${response.body}";
      String trimmedValue = value.substring(2, value.length - 1);
      if (response.statusCode == 200) {
        var responseModel =
        UploadFileModel.fromJson(json.decode(trimmedValue));
        if (responseModel.id != null) {
          model = responseModel;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<List<DocumentTypeDataModel>?> getDocumentTypes() async {
    String? bearer;
    List<DocumentTypeDataModel>? model;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      final queryParameters = {
        'populate': '*',
      };
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.documentTypesEndpoint)
              .replace(queryParameters: queryParameters);
      var response = await http.get(
        url,
        headers: {'Authorization': '$bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel =
            DocumentTypeModel.fromJson(json.decode(response.body));
        model = responseModel.data;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }

  Future<dynamic> postDocumentTypes(String name) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    int? id;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    await SharedPreferencesService()
        .getInteger('id')
        .then((value) => id = value);
    Map value = {
      'data': {
        'type': name,
        'users_permissions_user': id
      }
    };
    var body = json.encode(value);
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.documentTypesEndpoint);
      var response = await http.post(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
        body: body,
      );
      if (response.body.isNotEmpty) {
        var responseModel =
            PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> updateDocumentTypes(String name, int id) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    Map value = {
      'data': {
        'type': name,
      }
    };
    var body = json.encode(value);
    try {
      var url =
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.documentTypesEndpoint}/$id');
      var response = await http.put(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
        body: body,
      );
      if (response.body.isNotEmpty) {
        var responseModel =
        PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<dynamic> deleteDocumentTypes(int id) async {
    String? bearer;
    PostDocumentTypeDataAttributesModel? model;
    ErrorDataModel? error;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = 'Bearer $value');
    try {
      var url =
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.documentTypesEndpoint}/$id');
      var response = await http.delete(
        url,
        headers: {'Authorization': '$bearer', "Content-Type": "application/json"},
      );
      if (response.body.isNotEmpty) {
        var responseModel =
        PostDocumentTypeModel.fromJson(json.decode(response.body));
        if (responseModel.data?.attributes != null) {
          model = responseModel.data?.attributes;
        } else {
          error = ErrorModel.fromJson(json.decode(response.body)).error;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    if (model != null) {
      return model;
    } else {
      return error;
    }
  }

  Future<List<FolderDataAttributesDocumentsDataModel>?> getDocumentTypesById(
      int id) async {
    String? bearer;
    List<FolderDataAttributesDocumentsDataModel>? model;
    await SharedPreferencesService()
        .getString('jwt')
        .then((value) => bearer = '$value');
    try {
      final queryParameters = {
        'populate': '*',
      };
      var url = Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.documentTypesEndpoint}/$id')
          .replace(queryParameters: queryParameters);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearer'},
      );
      if (response.body.isNotEmpty) {
        var responseModel = FolderModel.fromJson(json.decode(response.body));
        final data = responseModel.data;
        model = data?.attributes?.documents?.data;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
}
