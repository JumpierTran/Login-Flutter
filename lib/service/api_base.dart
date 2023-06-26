import 'dart:async';

import 'package:camera_app/core/url.dart';
import 'package:camera_app/service/intercepter_api.dart';
import 'package:dio/dio.dart';

class BaseAPi {
  Dio _dio = Dio();

  BaseAPi() {
    BaseOptions options = BaseOptions(
      receiveTimeout: 50000,
      connectTimeout: 50000,
    );
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorApi());
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$uri',
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/$uri',
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        '$baseUrl/$uri',
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        '$baseUrl/$uri',
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch(
        '$baseUrl/$uri',
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }
}
