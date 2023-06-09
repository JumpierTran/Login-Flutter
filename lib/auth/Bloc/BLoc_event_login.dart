abstract class LoginEvent {}

class LoginPhoneChanged extends LoginEvent {
  final String phone;
  LoginPhoneChanged(
    this.phone,
  );

}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);

}

class LoginSubmitted extends LoginEvent {}
