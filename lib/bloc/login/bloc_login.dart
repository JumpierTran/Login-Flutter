import 'package:camera_app/bloc/login/event_login.dart';
import 'package:camera_app/bloc/login/state_login.dart';
import 'package:camera_app/service/auth_service.dart';
import 'package:camera_app/service/sessionmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();

  BuildContext? get context => null;
  LoginBLoc() : super(LoginInitial()) {
    on<PhoneEvent>(_phoneEvent);
    on<PasswordEvent>(_passwordEvent);
    on<LoginButtonPressed>(_loginButtonPressed);
    on<LogoutButtonPressed>(_logoutButtonPressed);
  }

  void _phoneEvent(PhoneEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(phone: state.phone));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: state.password));
  }

  void _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final data = {
        "phone": event.phone,
        "password": event.password,
      };
      final response = await _authService.login(data);
      if (response.session != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Lỗi đăng nhập không thành công'));
      }
    } catch (e) {
      emit(LoginFailure("Lỗi kết nối $e"));
    }

    // if (response.session != null) {
    //   Navigator.pushReplacementNamed(context!, '/dashboard');
    //   emit(LoginSuccess());
    //   print(response);
    // } else {
    //   emit(LoginFailure('Lỗi đăng nhập không thành công'));
    // }
    // } catch (e) {
    //   inspect(e);
    //   emit(LoginFailure('lỗi kết nối $e'));
    // }
  }

  void _logoutButtonPressed(
      LogoutButtonPressed event, Emitter<LogoutButtonPressed> emit) async {
        if(event is LogoutButtonPressed){

        await SessionManager.clearSession();
        }
  }
}
