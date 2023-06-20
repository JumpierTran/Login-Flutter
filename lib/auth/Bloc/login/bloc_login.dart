import 'package:camera_app/auth/Bloc/login/event_login.dart';
import 'package:camera_app/auth/Bloc/login/state_login.dart';
import 'package:camera_app/auth/auth_model.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:camera_app/service/sessionmanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  final BaseService baseService;
  late final SharedPreferences prefs;
  LoginBLoc(this.baseService) : super(LoginInitial()) {
    // on<LoginButtonPressed>((event, emit) async {
    //   final phone = event.phone;
    //   final password = event.password;
    //   if (phone.length != 10) {
    //     emit(LoginFailure(error: 'Số điện thoại phải có 10 số'));
    //     return;
    //   }
    //   if (password.length >= 8) {
    //     emit(LoginFailure(error: 'Mật khẩu phải có ít 8 kí tự '));
    //   }

    //   final regex = RegExp(
    //       r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$');
    //   if (!regex.hasMatch(password)) {
    //     emit(LoginFailure(
    //         error:
    //             'Mật khẩu phải ít nhất một chữ cái, một số và một kí tự đặc biệt'));
    //     return;
    //   }

    //   emit(LoginLoading()); // Cập nhật trạng thái đang tải

    //   try {
    //     // Gửi yêu cầu đăng nhập đến API và xử lý kết quả
    //     await baseService.login(phone, password);
    //     final session = ApiAuth().authInterceptor.authModel!.session;
    //     prefs.setString('Session-Key', session?.key ?? '');
    //     if (session != null) {
    //       emit(LoginSuccess()); // Cập nhật trạng thái đăng nhập thành công
    //     } else {
    //       emit(LoginFailure(error: 'Lỗi xác thực đăng nhập.'));
    //     }
    //   } catch (e) {
    //     emit(LoginFailure(error: 'Đăng nhập thất bại $e'));
    //   }
    // });
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      final phone = event.phone;
      final password = event.password;

      if (phone.isEmpty || password.isEmpty) {
        yield LoginFailure(
            error: 'Vui lòng nhập lại số điện thoại và mật khẩu');
        return;
      } else if (event.password.length >= 8) {
        yield LoginFailure(
            error: 'Mật khẩu phải có ít nhất bằng 8 hoặc nhiều hơn');
      } else {
        yield LoginLoading();
        try {
          final response =
              await ApiAuth().loginUser(event.phone, event.password);
          if (response.statusCode == 200) {
            final session = Session.fromJson(response.data['Authorization']);
            SessionManager().setSessionKey(session.key ?? '');
            yield LoginSuccess(phone);
          }else {
            yield
          }
        } catch (e) {
          yield LoginFailure(error: 'Đăng nhập thất bại $e');
        }
      }
    }
  }
}
