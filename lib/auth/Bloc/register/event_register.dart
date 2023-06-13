abstract class RegisterEvent {}

class RegisterOnPressed extends RegisterEvent {
  final String phone;
  final String password;
  final String retypepassword;
  final String fullname;
  final String address;

  RegisterOnPressed(this.phone, this.password, this.retypepassword, this.fullname, this.address);
}

class RegisterOnSubmitted extends RegisterEvent {}
