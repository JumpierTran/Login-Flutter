import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class PhoneEvent extends LoginEvent {
  final String phone;

  PhoneEvent({this.phone = ""});

  @override
  List<Object> get props => [phone];
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent({this.password = ""});

  @override
  List<Object> get props => [password];
}

class LoginButtonPressed extends LoginEvent {
  
  @override
  List<Object> get props => [];
}
