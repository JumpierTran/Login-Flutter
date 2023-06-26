import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String phone;
  final String password;

  const LoginState(
      {this.phone = "", this.password = ""});

  LoginState copyWith({
    String? phone,
    String? password,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [phone, password];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMesage;

  LoginFailure(this.errorMesage);

  @override
  List<Object> get props => [errorMesage];
}

