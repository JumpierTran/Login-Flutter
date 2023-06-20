import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;

  LoginButtonPressed(this.phone, this.password);

  @override
  List<Object> get props => [phone, password];
}


