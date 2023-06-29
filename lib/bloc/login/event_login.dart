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
  final String phone;
  final String password;

  LoginButtonPressed(this.phone, this.password);
  @override
  List<Object> get props => [phone, password];
}

// class LogoutButtonPressed extends LoginEvent {
//   final String session;

//   LogoutButtonPressed(this.session);
//   @override
//   List<Object?> get props => [session];
// }
