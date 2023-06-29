import 'dart:developer';

import 'package:camera_app/core/global.dart';
import 'package:dio/dio.dart';

class ApiDio extends InterceptorsWrapper {
  // Dio _dio = Dio();

  static BaseOptions opts = BaseOptions(
    baseUrl: "https://app.mekongsmartcam.vn/edge/vshome",
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );

  static final _dio = Dio(opts);
  //  AuthInterceptor authInterceptor;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (Global.session != "") {
      options.headers['session'] = Global.session;
    }

    print("object");

    super.onRequest(options, handler);
    handler.next(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }

  // _dio.interceptors.add(AuthInterceptor());

  // ApiDio() {
  //   authInterceptor = AuthInterceptor();
  //   _dio.interceptors.add(AuthInterceptor());
  // }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }

  // Future<AuthModel?> loginUser(String phone, String password) async {
  //   try {
  //     const url = '$baseUrl/me/login';
  //     final data = {
  //       'phone': phone,
  //       'password': password,
  //     };
  //     final response = await _dio.post(url, data: data);
  //     return AuthModel.fromJson(response as Map<String, dynamic>);
  //   } catch (e) {
  //     inspect(e);
  //   }
  //   return null;
  // }

  // Future<AuthModel> registerUser(String phone, String password,
  //     String retypepassword, String fullname, String address) async {
  //   const url = '$baseUrl/api/vshome/users';
  //   final data = {
  //     'phone': phone,
  //     'password': password,
  //     'retypepassword': retypepassword,
  //     'fullname': fullname,
  //     'address': address,
  //   };
  //   try {
  //     final response = await _dio.post(url, data: data);
  //     return AuthModel.fromJson(response as Map<String, dynamic>);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<Response> devices(
  //     String type, Attributes attributes, String id) async {
  //   const url = '$baseUrl/api/vshome/devices_users';
  //   final data = {
  //     'id': id,
  //     'type': type,
  //     'attributes': attributes,
  //   };

  //   try {
  //     final response = await _dio.get(url, queryParameters: data);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
