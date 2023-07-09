import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/model/model_camera.dart';
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

  Future<List<CameraModel>> getcamera() async {
    List<CameraModel> camera = [];
    final res = await _dioAuth.get('/me/devices');

    res['data'].forEach((e) {
      camera.add(CameraModel.fromJson(res));
    });
    return camera;
  }

  Future<CameraModel> createcamera(data) async {
    final res =
        await _dioAuth.post('/api/vshome/device_users', queryParameters: data);
    return CameraModel.fromJson(res);
  }
}
