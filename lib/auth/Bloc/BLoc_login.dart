import 'package:camera_app/auth/form_submission_status.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:camera_app/service/api.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera_app/auth/Bloc/BLoc_State_login.dart';
import 'package:camera_app/auth/Bloc/BLoc_event_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Bloc

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SharedPreferences? prefs;
  LoginBloc() : super(LoginState()) {
    initPrefs();
    on<LoginPhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) {
      emit(state.copyWith(formStatus: FormSubmitting()));
    });
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPhoneChanged) {
      yield state.copyWith(phone: event.phone);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        if (state.phone.isEmpty || state.password.isEmpty) {
          yield state.copyWith(
              formStatus:
                  SubmisssionFailed('Vui lòng nhập lại sdt và mật khẩu' as Exception));
        }
        await loginUser(state.phone, state.password);
          final session = prefs?.getString('session');
          if (session != null) {
          ApiAuth().authInterceptor.authModel?.session;
          }
        yield state.copyWith(formStatus: SubmisssionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmisssionFailed(e as Exception,
                errorMessage:
                    'Đăng nhập thất bại. Vui lòng kiểm tra lại tài khoản hoặc mật khẩu.'));
        print('Lỗi đăng nhập: ${e.toString()}');
      }
    }
  }
}
