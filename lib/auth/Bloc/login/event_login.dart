abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;

  LoginButtonPressed(this.phone, this.password);
}


class LogoutButtonPressed extends LoginEvent {}

class ResetPassword extends LoginEvent {}

