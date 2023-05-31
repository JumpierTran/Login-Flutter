import 'package:camera_app/auth/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:camera_app/service/Store.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUser(String phone, String password) async {
  var url =
      'https://app.mekongsmartcam.vn/edge/vshome/me/login'; // URL của API đăng nhập

  var data = {
    'phone': phone,
    'password': password,
  };

  var dio = Dio();

  try {
    var response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      print('Đăng nhập thành công');
      var session = response.headers['session']?.first;
      if (session != null) {
        dio.options.headers['session'] = session;
        // Gửi yêu cầu API tiếp theo sử dụng session
        await fetchUserInfoLogin(dio);
      } else {
        print('Không tìm thấy session trong phản hồi');
      }
    } else {
      print('Đăng nhập thất bại. Mã lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Đăng nhập thất bại. Lỗi: $e');
  }
}

Future<void> fetchUserInfoLogin(Dio dio) async {
  var url =
      'https://app.mekongsmartcam.vn/edge/vshome/me/userinfo'; // URL của API lấy thông tin người dùng

  try {
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var userInfo = response.data;
      AuthModel auth = AuthModel.fromJson(response.data);

      print(auth.id);
      print(auth.phone);
      print(auth.customerCode);
      print('Thông tin người dùng: $userInfo');
    } else {
      print(
          'Lấy thông tin người dùng thất bại. Mã lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Lấy thông tin người dùng thất bại. Lỗi: $e');
  }
}

Future<void> registerUser(
  String phone,
  String password,
  String fullName,
  String address,
) async {
  var url =
      'https://app.mekongsmartcam.vn/edge/vshome/api/vshome/users'; // URL của API đăng ký

  var data = {
    'phone': phone,
    'password': password,
    'fullName': fullName,
    'address': address,
  };

  var dio = Dio();

  try {
    var response = await dio.post(
      url,
      data: data,
    );

    if (response.statusCode == 200) {
      print('Đăng ký thành công');
      var session = response.headers['session'];
      if (session != null) {
        dio.options.headers['session'] = session;
        // Sử dụng session cho các yêu cầu API tiếp theo
        await fetchUserInfoResgister(dio);
      } else {
        print('Không tìm thấy session trong phản hồi');
      }
    } else {
      print('Đăng ký thất bại. Mã lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Đăng ký thất bại. Lỗi: $e');
  }
}

Future<void> fetchUserInfoResgister(Dio dio) async {
  var url =
      'https://app.mekongsmartcam.vn/edge/vshome/api/vshome/users'; // URL của API lấy thông tin người dùng

  try {
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var userInfo = response.data;
      print('Thông tin người dùng: $userInfo');
    } else {
      print(
          'Lấy thông tin người dùng thất bại. Mã lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Lấy thông tin người dùng thất bại. Lỗi: $e');
  }
}
