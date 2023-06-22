import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/service/api_base.dart';

class AuthService {
  BaseAPi _dioAuth = BaseAPi();

  Future<AuthModel> login(data) async {
    final res = await _dioAuth.post('me/login', data: data);
    return AuthModel.fromJson(res);
  }
}
