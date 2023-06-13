import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/core/global.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuth {
  late Dio _dio = Dio();
  late AuthInterceptor authInterceptor;
  final String baseUrl = 'https://app.mekongsmartcam.vn/edge/vshome';
  ApiAuth() {
    // _dio.options.baseUrl = 'https://app.mekongsmartcam.vn/edge/vshome';
    authInterceptor = AuthInterceptor();
    _dio.interceptors.add(authInterceptor);
    // _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;

  Future<Response> loginUser(String phone, String password) async {
    final url = '$baseUrl/me/login';
    final data = {
      'phone': phone,
      'password': password,
    };
    try {
      final response = await _dio.post(url, queryParameters: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> registerUser(String phone, String password,
      String retypepassword, String fullname, String address) async {
    final url = '$baseUrl+';
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
}

class AuthInterceptor extends Interceptor {
  AuthModel? authModel;
  late SharedPreferences prefs;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authModel != null && authModel!.session != null) {
      options.headers['session'] = authModel!.session;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Lưu session  từ response từ authModel
    final responseData = response.data as Map<String, dynamic>;
    final sessionData = responseData['session'] as Map<String, dynamic>?;
    if (sessionData != null) {
      Global().authModel?.session = sessionData as Session?;
      prefs.setString('session', sessionData as String);
    }
    super.onResponse(response, handler);
  }
}
