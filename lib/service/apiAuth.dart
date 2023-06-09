import 'package:camera_app/auth/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

class AuthInterceptor extends Interceptor {
  AuthModel? authModel;
  SharedPreferences? prefs;

  AuthInterceptor() {
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
      authModel?.session = Session.fromJson(sessionData);
      prefs?.setString('session', authModel!.session as String);
    }
    super.onResponse(response, handler);
  }
}
