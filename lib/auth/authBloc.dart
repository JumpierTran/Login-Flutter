import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final String? token;

  AuthState(this.status, {this.token});
}

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  LoginEvent(this.phone, this.password);
}

class LogoutEvent extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  AuthBloc(this._dio, this._sharedPreferences) : super(AuthState(AuthStatus.initial)) {
    // Kiểm tra session khi khởi tạo AuthBloc
    final token = _sharedPreferences.getString('token');
    if (token != null) {
      emit(AuthState(AuthStatus.authenticated, token: token));
    }
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthState(AuthStatus.loading);

      try {
        // Gọi API đăng nhập bằng Dio
        final response = await _dio.post(
          'https://app.mekongsmartcam.vn/edge/vshome/me/login',
          data: {
            'phone': event.phone,
            'password': event.password,
          },
        );

        // Kiểm tra kết quả và cập nhật trạng thái
        if (response.statusCode == 200) {
          final token = response.data['token'];

          // Lưu token vào shared preferences
          await _sharedPreferences.setString('token', token);

          yield AuthState(AuthStatus.authenticated, token: token);
        } else {
          yield AuthState(AuthStatus.unauthenticated);
        }
      } catch (e) {
        yield AuthState(AuthStatus.unauthenticated);
      }
    } else if (event is LogoutEvent) {
      // Xóa token khỏi shared preferences
      await _sharedPreferences.remove('token');

      yield AuthState(AuthStatus.unauthenticated);
    }
  }
}
