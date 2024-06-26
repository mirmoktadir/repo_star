// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'api_header.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 2000;
  BaseOptions baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: TIME_OUT_DURATION),
    receiveTimeout: const Duration(seconds: TIME_OUT_DURATION),
    sendTimeout: const Duration(seconds: TIME_OUT_DURATION),
  );

  //GET

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      var response = await Dio(baseOptions).get(url,
          options: Options(headers: Header.rapidApiHeader),
          queryParameters: params);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //POST

  Future<dynamic> post(
      {required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await Dio(baseOptions).post(url,
          options: Options(headers: Header.defaultHeader),
          queryParameters: params,
          data: payload);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH

  Future<dynamic> patch(
      {required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await Dio(baseOptions).patch(url,
          options: Options(headers: Header.defaultHeader),
          queryParameters: params,
          data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE

  Future<dynamic> delete(
      {required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await Dio(baseOptions).delete(url,
          options: Options(headers: Header.defaultHeader),
          queryParameters: params,
          data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR MULTIPLE FILE UPLOAD

  List<File>? docFileList = [];

  Future<dynamic> multipartRequest({
    required String url,
    Map<String, dynamic>? params,
    required Map<String, dynamic> body,
    String? filepath,
  }) async {
    var formData = FormData.fromMap(body);
    for (var files in docFileList!) {
      filepath = files.path;
      formData.files.addAll(
          [MapEntry("document[]", await MultipartFile.fromFile(filepath))]);
    }

    try {
      var response = await Dio(baseOptions).post(url,
          options: Options(headers: Header.defaultMultipartHeader),
          queryParameters: params,
          data: formData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR SINGLE FILE UPLOAD

  Future<dynamic> multipartSingleFile(
      {required String url,
      Map<String, dynamic>? params,
      required Map<String, dynamic> body,
      String? filepath,
      required String key}) async {
    var formData = FormData.fromMap(body);
    if (filepath != null) {
      formData.files.add(MapEntry(key, await MultipartFile.fromFile(filepath)));
    }

    try {
      var response = await Dio(baseOptions).post(url,
          options: Options(headers: Header.defaultMultipartHeader),
          queryParameters: params,
          data: formData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
