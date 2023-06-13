import 'package:camera_app/auth/Bloc/login/event_login.dart';
import 'package:camera_app/auth/Bloc/login/state_login.dart';
import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/core/global.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  late final SharedPreferences? prefs;
  AuthModel? authModel;
  LoginBLoc(this.prefs) : super(LoginInitial()) {
    initPrefs();
    on<LoginButtonPressed>((event, emit) {
      final phone = event.phone;
      final password = event.password;
      if (phone.isEmpty || password.isEmpty) {
        emit(LoginFailure(error: 'Vui lòng nhập số điện thoại và mật khẩu'));
        return;
      }
      


    });
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final savedSession = Global().prefs.getString('session');
    if (savedSession != null) {
      authModel?.session =
          Session.fromJson(savedSession as Map<String, dynamic>);
      ApiAuth().authInterceptor.authModel?.session;
    }
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      final phone = event.phone;
      final password = event.password;

      if (phone.isEmpty || password.isEmpty) {
        yield LoginFailure(
            error: 'Vui lòng nhập lại số điện thoại và mật khẩu');
        return;
      } else {
        yield LoginLoading();
        try {
          await BaseService().login(phone, password);
          final session = prefs?.getString('session');
          if (session != null) {
            ApiAuth().authInterceptor.authModel?.session;
            yield LoginSuccess();
          }
        } catch (e) {
          yield LoginFailure(error: 'Đăng nhập thất bại');
        }
      }
    }
  }
}
