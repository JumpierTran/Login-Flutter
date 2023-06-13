import 'package:camera_app/service/apiAuth.dart';

class BaseService {
  final ApiAuth _dio = ApiAuth();

  Future<void> login(String phone, String password) async {
    await _dio.loginUser(phone, password);
  }

  Future<void> register(String phone, String password, String retypepassword,
      String fullname, String address) async {
    await _dio.registerUser(phone, password, retypepassword, fullname, address);
  }

  
}
