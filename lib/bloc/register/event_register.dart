import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class AddressEvent extends RegisterEvent {
  final String address;
  const AddressEvent({this.address = ""});

  AddressEvent copyWith({String? address}) {
    return AddressEvent(address: address ?? this.address);
  }

  @override
  List<Object?> get props => [address];
}

class FullnameEvent extends RegisterEvent {
  final String fullname;
  const FullnameEvent({this.fullname = ""});
  FullnameEvent copyWith({String? fullname}) {
    return FullnameEvent(fullname: fullname ?? this.fullname);
  }

  @override
  List<Object?> get props => [];
}

class PhoneEvent extends RegisterEvent {
  final String phone;
  const PhoneEvent({this.phone = ""});
  PhoneEvent copyWith({String? phone}) {
    return PhoneEvent(phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props => [];
}

class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent({this.password = ""});
  PasswordEvent copyWith({String? password}) {
    return PasswordEvent(password: password ?? this.password);
  }

  @override
  List<Object?> get props => [password];
}

class RetypePasswordEvent extends RegisterEvent {
  final String retypepassword;
  const RetypePasswordEvent({this.retypepassword = ""});
  RetypePasswordEvent copyWith({String? retypepassword}) {
    return RetypePasswordEvent(
        retypepassword: retypepassword ?? this.retypepassword);
  }

  @override
  List<Object?> get props => [retypepassword];
}

class RegisterButtonPressed extends RegisterEvent {
  final String address;
  final String fullname;
  final String phone;
  final String password;
  final String retypepassword;

  RegisterButtonPressed(this.address, this.fullname, this.phone, this.password, this.retypepassword);

  @override
  List<Object> get props => [address,fullname,phone,password,retypepassword];
}
