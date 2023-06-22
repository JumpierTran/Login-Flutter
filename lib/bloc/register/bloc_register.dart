import 'package:camera_app/bloc/register/event_register.dart';
import 'package:camera_app/bloc/register/state_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<AddressEvent>(_addressEvent);
    on<FullnameEvent>(_fullnameEvent);
    on<PhoneEvent>(_phoneEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RetypePasswordEvent>(_retypepasswordEvent);
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
  void _retypepasswordEvent(RetypePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(retypepassword: state.retypepassword));
  }
}
