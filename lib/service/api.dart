import 'dart:js';

import 'package:camera_app/page/CameraPage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:camera_app/interceptors/dio_interceptor.dart';
import 'package:camera_app/service/Store.dart';
import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchData() async {
  try {
    Dio dio = Dio();
    String url = "https://app.mekongsmartcam.vn/edge/";

    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      print(data);
    } else {
      print("Lỗi khi gửi yêu cầu GET: ${response.statusCode}");
    }
  } catch (e) {
    print("Đã xảy ra lỗi: $e");
  }
}

// void postData() async {
//   try {
//     Dio dio = Dio();
//     String url = "https://app.mekongsmartcam.vn/edge/vshome/me/login";

//     Map<String, dynamic> jsonData = {
//       // Thay đổi đây để phù hợp với dữ liệu JSON cần gửi
//       "phone": "0123456789",
//       "password": "Vnpt@123",
//     };

//     Response response = await dio.post(url, data: jsonData);

//     if (response.statusCode == 200) {
//       // Yêu cầu POST thành công
//       Map<String, dynamic> data = response.data;

//       // Kiểm tra session trong dữ liệu trả về
//       if (data.containsKey('session')) {
//         // Lưu session vào shared preferences
//         String session = data['session'];
//         await _saveSession(session);

//         // Tiến hành chuyển hướng tới trang chủ của app
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>CameraPage()));
//       } else {
//         // Hiển thị thông báo "no_session"
//         print('no_session');
//       }
//     } else {
//       // Xử lý lỗi khi gửi yêu cầu POST
//       print('Lỗi khi gửi yêu cầu POST: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Xử lý lỗi khi gọi API
//     print("Đã xảy ra lỗi: $e");
//   }
// }

// Future<void> _saveSession(String action) async {
//   final preferences = await SharedPreferences.getInstance();
//   await preferences.setString('session', session);
// }
