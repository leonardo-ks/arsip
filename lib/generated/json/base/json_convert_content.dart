// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:arsip/data/model/document_type_model_entity.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/login_model.dart';
import 'package:arsip/data/model/user_model.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(DocumentTypesModel).toString(): DocumentTypesModel.fromJson,
		(DocumentTypesDataModel).toString(): DocumentTypesDataModel.fromJson,
		(DocumentTypesDataAttributesModel).toString(): DocumentTypesDataAttributesModel.fromJson,
		(DocumentsModel).toString(): DocumentsModel.fromJson,
		(DocumentsDataModel).toString(): DocumentsDataModel.fromJson,
		(DocumentsDataAttributesModel).toString(): DocumentsDataAttributesModel.fromJson,
		(DocumentsDataAttributesAttachmentModel).toString(): DocumentsDataAttributesAttachmentModel.fromJson,
		(DocumentsDataAttributesAttachmentDataModel).toString(): DocumentsDataAttributesAttachmentDataModel.fromJson,
		(DocumentsDataAttributesAttachmentDataAttributesModel).toString(): DocumentsDataAttributesAttachmentDataAttributesModel.fromJson,
		(DocumentsDataAttributesAttachmentDataAttributesFormatsModel).toString(): DocumentsDataAttributesAttachmentDataAttributesFormatsModel.fromJson,
		(DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail).toString(): DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.fromJson,
		(DocumentsDataAttributesDocumentTypeModel).toString(): DocumentsDataAttributesDocumentTypeModel.fromJson,
		(DocumentsDataAttributesDocumentTypeDataModel).toString(): DocumentsDataAttributesDocumentTypeDataModel.fromJson,
		(DocumentsDataAttributesDocumentTypeDataAttributesModel).toString(): DocumentsDataAttributesDocumentTypeDataAttributesModel.fromJson,
		(LoginModel).toString(): LoginModel.fromJson,
		(UserModel).toString(): UserModel.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<DocumentTypesModel>[] is M){
			return data.map<DocumentTypesModel>((Map<String, dynamic> e) => DocumentTypesModel.fromJson(e)).toList() as M;
		}
		if(<DocumentTypesDataModel>[] is M){
			return data.map<DocumentTypesDataModel>((Map<String, dynamic> e) => DocumentTypesDataModel.fromJson(e)).toList() as M;
		}
		if(<DocumentTypesDataAttributesModel>[] is M){
			return data.map<DocumentTypesDataAttributesModel>((Map<String, dynamic> e) => DocumentTypesDataAttributesModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsModel>[] is M){
			return data.map<DocumentsModel>((Map<String, dynamic> e) => DocumentsModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataModel>[] is M){
			return data.map<DocumentsDataModel>((Map<String, dynamic> e) => DocumentsDataModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesModel>[] is M){
			return data.map<DocumentsDataAttributesModel>((Map<String, dynamic> e) => DocumentsDataAttributesModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesAttachmentModel>[] is M){
			return data.map<DocumentsDataAttributesAttachmentModel>((Map<String, dynamic> e) => DocumentsDataAttributesAttachmentModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesAttachmentDataModel>[] is M){
			return data.map<DocumentsDataAttributesAttachmentDataModel>((Map<String, dynamic> e) => DocumentsDataAttributesAttachmentDataModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesAttachmentDataAttributesModel>[] is M){
			return data.map<DocumentsDataAttributesAttachmentDataAttributesModel>((Map<String, dynamic> e) => DocumentsDataAttributesAttachmentDataAttributesModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesAttachmentDataAttributesFormatsModel>[] is M){
			return data.map<DocumentsDataAttributesAttachmentDataAttributesFormatsModel>((Map<String, dynamic> e) => DocumentsDataAttributesAttachmentDataAttributesFormatsModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail>[] is M){
			return data.map<DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail>((Map<String, dynamic> e) => DocumentsModelDataAttributesAttachmentDataAttributesFormatsThumbnail.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesDocumentTypeModel>[] is M){
			return data.map<DocumentsDataAttributesDocumentTypeModel>((Map<String, dynamic> e) => DocumentsDataAttributesDocumentTypeModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesDocumentTypeDataModel>[] is M){
			return data.map<DocumentsDataAttributesDocumentTypeDataModel>((Map<String, dynamic> e) => DocumentsDataAttributesDocumentTypeDataModel.fromJson(e)).toList() as M;
		}
		if(<DocumentsDataAttributesDocumentTypeDataAttributesModel>[] is M){
			return data.map<DocumentsDataAttributesDocumentTypeDataAttributesModel>((Map<String, dynamic> e) => DocumentsDataAttributesDocumentTypeDataAttributesModel.fromJson(e)).toList() as M;
		}
		if(<LoginModel>[] is M){
			return data.map<LoginModel>((Map<String, dynamic> e) => LoginModel.fromJson(e)).toList() as M;
		}
		if(<UserModel>[] is M){
			return data.map<UserModel>((Map<String, dynamic> e) => UserModel.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}