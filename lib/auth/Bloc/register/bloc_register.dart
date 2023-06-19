import 'package:camera_app/auth/Bloc/register/event_register.dart';
import 'package:camera_app/auth/Bloc/register/state_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SharedPreferences sharedPreferences;
  RegisterBloc(this.sharedPreferences) : super(RegisterInitial());

  Stream<RegisterEvent> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterOnPressed) {
      String phone = event.phone;
      String password = event.password;
      String retypepassword = event.retypepassword;
      String fullname = event.fullname;
      String address = event.address;
      if (phone.isEmpty ||
          password.isEmpty ||
          retypepassword.isEmpty ||
          fullname.isEmpty ||
          address.isEmpty) {
        // yield RegisterEmptyFailure('');
        return;
      }
    }
  }

  void saveUserData(String phone, String fullname, String address) {
    // Lưu thông tin người dùng vào SharedPreferences
    sharedPreferences.setString('phone', phone);
    sharedPreferences.setString('fullname', fullname);
    sharedPreferences.setString('address', address);
  }
}
