import 'package:camera_app/bloc/register/event_register.dart';
import 'package:camera_app/bloc/register/state_register.dart';
import 'package:camera_app/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthService _authService = AuthService();
  RegisterBloc() : super(const RegisterState()) {
    on<AddressEvent>(_addressEvent);
    on<FullnameEvent>(_fullnameEvent);
    on<PhoneEvent>(_phoneEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RetypePasswordEvent>(_retypepasswordEvent);
    on<RegisterButtonPressed>(_registerButtonPressed);
  }

  void _addressEvent(AddressEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(address: state.address));
  }

  void _fullnameEvent(FullnameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(fullname: state.fullname));
  }

  void _phoneEvent(PhoneEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phone: state.phone));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: state.password));
  }

  void _retypepasswordEvent(
      RetypePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(retypepassword: state.retypepassword));
  }

  void _registerButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      final data = {
        "address": event.address,
        "fullname": event.fullname,
        "phone": event.phone,
        "password": event.password,
        "retypepassword": event.retypepassword,
      };
      final response = await _authService.register(data);
      if (response.session != null) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure("Lỗi đăng ký không thành công"));
      }
    } catch (e) {
      emit(RegisterFailure("Lỗi kết nối $e"));
    }
  }
}
