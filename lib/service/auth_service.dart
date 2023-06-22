import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/core/url.dart';
import 'package:camera_app/service/api_dio.dart';
// import 'package:dio/dio.dart';

class AuthService {
  ApiDio _dioauth = ApiDio();

  Future<AuthModel> login(data) async {
    print(data);
    final response = await _dioauth.post('/me/login', data: data);
    return AuthModel.fromJson(response as Map<String, dynamic>);
  }
}
