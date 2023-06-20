import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String phone;

  LoginSuccess(this.phone);

  @override
  List<Object> get props => [phone];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
