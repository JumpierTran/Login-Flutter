import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/service/api_base.dart';

class AuthService {
  BaseAPi _dioAuth = BaseAPi();

  Future<AuthModel> login(data) async {
    final res = await _dioAuth.post('me/login', data: data);
    return AuthModel.fromJson(res);
  }

  Future<AuthModel> register(data) async {
    final res = await _dioAuth.post('api/vshome/users', data: data);
    return AuthModel.fromJson(res);
  }

  Future<AuthModel> getcamera(data) async {
    final res =
        await _dioAuth.get('/api/vshome/device_users', queryParameters: data);
    return AuthModel.fromJson(res);
  }

  Future<AuthModel> createcamera(data) async {
    final res = await _dioAuth.post('/api/vshome/device_users',
        queryParameters: data);
    return AuthModel.fromJson(res);
  }
}
