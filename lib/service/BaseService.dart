// import 'dart:developer';

import 'package:camera_app/service/apiAuth.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';

class BaseService {
  final ApiAuth _dio = ApiAuth();

  Future<void> login(String phone, String password) async {
    await _dio.loginUser(phone, password);
  }
}


  
  

//   Future<AuthModel> createlogin(phone,password) async {
//     Response res;
//     res =  await _dio.post("/login",);
//   }

  





