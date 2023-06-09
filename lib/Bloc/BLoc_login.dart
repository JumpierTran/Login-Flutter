import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Login Event
abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String phoneValue;
  final String passwordValue;
  LoginTextChangedEvent(this.phoneValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String phone;
  final String password;

  LoginSubmittedEvent(this.phone, this.password);
}

//Login State
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginInvalidState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState {}

//Bloc

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPreferences sharedPreferences;
  final reposiotry = BaseService();
  AuthInterceptor authInterceptor = AuthInterceptor();
  LoginBloc(this.sharedPreferences) : super(LoginInitialState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginTextChangedEvent) {
      if (event.phoneValue.isEmpty || event.phoneValue.length == 10) {
        yield LoginErrorState('Vui lòng nhập số điện thoại hợp lệ!');
      } else if (event.passwordValue.length >= 8) {
        yield LoginErrorState('Vui lòng nhập mật khẩu hợp lệ!');
      } else {
        yield LoginValidState();
      }
    } else if (event is LoginSubmittedEvent) {
      yield LoginLoadingState();
      final session = sharedPreferences.getString('session');
      await reposiotry.login(event.phone, event.password);
      if (session != null) {
        yield LoginValidState();
        authInterceptor.authModel?.session = session as Session?;
      }
    }
  }
}
