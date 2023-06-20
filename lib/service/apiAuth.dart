import 'dart:async';
import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/core/global.dart';
import 'package:camera_app/model/model_devices.dart';
import 'package:camera_app/service/sessionmanager.dart';
import 'package:dio/dio.dart';

class ApiAuth {
  late Dio _dio = Dio();
  late AuthInterceptor authInterceptor;
  final String baseUrl = 'https://app.mekongsmartcam.vn/edge/vshome';

  ApiAuth() {
    authInterceptor = AuthInterceptor();
    _dio.interceptors.add(authInterceptor);
  }

  Future<Response> loginUser(String phone, String password) async {
    final url = '$baseUrl/me/login';
    final data = {
      'phone': phone,
      'password': password,
    };
    try {
      final response = await _dio.post(url, queryParameters: data);
      authInterceptor.authModel = AuthModel.fromJson(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> registerUser(String phone, String password,
      String retypepassword, String fullname, String address) async {
    final url = '$baseUrl/api/vshome/users';
    final data = {
      'phone': phone,
      'password': password,
      'retypepassword': retypepassword,
      'fullname': fullname,
      'address': address,
    };
    try {
      final response = await _dio.post(url, queryParameters: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> devices(
      String type, Attributes attributes, String id) async {
    final url = '$baseUrl/api/vshome/devices_users';
    final data = {
      'id': id,
      'type': type,
      'attributes': attributes,
    };

    try {
      final response = await _dio.get(url, queryParameters: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

class AuthInterceptor extends Interceptor {
  AuthModel? authModel;
  Timer? sessionTimer;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (Global.session != "") {
      options.headers['session'] = Global.session;
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    // return response.data;
    // try {
    //   final responseData = response.data as Map<String, dynamic>;
    //   final sessionData =
    //       responseData['Authorization'] as Map<String, dynamic>?;
    //   if (sessionData != null) {
    //     final session = Session.fromJson(sessionData);
    //     authModel!.session = session;
    //     SessionManager().setSessionKey(session.key ?? '');

    //     // Đặt timer để đăng xuất khi session hết hạn
    //     final expirationTime = session.expirationTime;
    //     final currentTime = DateTime.now();
    //     final duration = expirationTime.difference(currentTime);

    //     sessionTimer = Timer(duration, () {
    //       // Thực hiện đăng xuất khi session hết hạn
    //       SessionManager().getSessionKey();
    //       // Thực hiện chuyển hướng đến trang đăng nhập (hoặc hiển thị thông báo đăng xuất)
    //     });
    //   }
    // } catch (e) {
    //   print('Lỗi xử lý response: $e');
    // }
  }
}
