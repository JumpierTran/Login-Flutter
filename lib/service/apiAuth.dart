import 'package:camera_app/service/BaseService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuth {
  Dio _dio = Dio();
  ApiAuth._internal();

  static final _singleton = ApiAuth._internal();

  factory ApiAuth() => _singleton;

  get context => null;

  //Tạo dio options thời gian kết nối và nhận của dio
  void createDio() {
    _dio.options.baseUrl = 'https://app.mekongsmartcam.vn/edge/vshome';
    _dio.options.connectTimeout = Duration(seconds: 3);
    _dio.options.receiveTimeout = Duration(seconds: 3);

    final options = BaseOptions(
      baseUrl: 'https://app.mekongsmartcam.vn/edge/vshome',
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3),
    );
    final anotherDio = Dio(options);
  }

  //setup của interceptors
  void setupInterceptors() {
    _dio.interceptors.add(AppInterceptors());
  }

  //Phương thức post của Đăng ký
  Future<void> register({
    required String address,
    required String fullname,
    required String password,
    required String retypePassword,
    required String phone,
  }) async {
    try {
      final response = await _dio.get(
          'https://app.mekongsmartcam.vn/edge/vshome/api/vshome/users',
          data: {
            'address': address,
            'fullname': fullname,
            'password': password,
            'retypepassword': retypePassword,
            'phone': phone,
          });

      if (response.statusCode == 200) {
        showSuccessSnackBar(context!, 'Đăng ký thành công');
        print('Đăng ký thành công');
      } else {
        showErrorSnackBar(context!, "Đăng ký không thành công");
      }
    } catch (e) {
      print(e);
    }
  }

  // hiển thị thông báo thành công
  void showSuccessSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Hiển thị thông báo không thành công
  void showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Phương thức post của Đăng nhập
  Future<void> login({
    required String? phone,
    required String? password,
  }) async {
    try {
      final response = await _dio.post(
        'https://app.mekongsmartcam.vn/edge/vshome/me/login',
        data: {
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final authToken = response.data['token'];
        print('Đăng nhập thành công');
      } else {
        final errorMessage =
            response.data['message'] ?? 'Đăng nhập không thành công';
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Đã xảy ra lỗi :$e');
      throw Exception('Đăng nhập không thành công');
    }
  }

  void logoutUser() {
    Navigator.pushNamed(context, '/');
  }

  // Phương thức GET
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}

class AppInterceptors extends Interceptor {
  String? accessToken;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      // Token hết hạn hoặc không hợp lệ
      // Xử lý logic tại đây, ví dụ như đăng xuất người dùng và yêu cầu đăng nhập lại

      print(response.statusCode);
    }
    return onResponse(response, handler);
  }
}



// Phương thức POST
// Future<Response> post(String url, dynamic data) async {
//   try {
//     final response = await ApiAuth.dio.post(
//       url,
//       data: data,
//     );
//     return response;
//   } catch (e) {
//     throw e;
//   }
// }

// Phương thức PUT
// Future<Response> put(String url, dynamic data) async {
//   try {
//     final response = await ApiAuth.dio.put(
//       url,
//       data: data,
//     );
//     return response;
//   } catch (e) {
//     throw e;
//   }
// }

// Phương thức PATCH
// Future<Response> patch(String url, dynamic data) async {
//   try {
//     final response = await ApiAuth.dio.patch(
//       url,
//       data: data,
//     );
//     return response;
//   } catch (e) {
//     throw e;
//   }
// }

// Phương thức DELETE
// Future<Response> delete(String url) async {
//   try {
//     final response = await ApiAuth.dio.delete(url);
//     return response;
//   } catch (e) {
//     throw e;
//   }
// }
