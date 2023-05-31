import 'package:camera_app/service/apiAuth.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as img;

class BaseService {
  ApiAuth _dio = ApiAuth();

  String? phone;
  String? password;
  //  final response = await get('http')
  // Phương thức GET
  // Future<Response> get(String url,
  //     {Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response = await _dio.login(phone: phone, password: password);
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}

  
  

//   Future<AuthModel> createlogin(phone,password) async {
//     Response res;
//     res =  await _dio.post("/login",);
//   }

  





