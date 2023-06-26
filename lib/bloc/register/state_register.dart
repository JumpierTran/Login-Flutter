import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String address;
  final String fullname;
  final String phone;
  final String password;
  final String retypepassword;
  //optional named parameters
  const RegisterState(
      {this.address = "",
      this.fullname = "",
      this.phone = "",
      this.password = "",
      this.retypepassword = "",
      });

  RegisterState copyWith(
      {String? address,
      String? fullname,
      String? phone,
      String? password,
      String? retypepassword,
      }) {
    return RegisterState(
        address: address ?? this.address,
        fullname: fullname ?? this.fullname,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        retypepassword: retypepassword ?? this.retypepassword,
        );
  }

  @override
  List<Object> get props => [address,fullname,phone,password,retypepassword,];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);

  @override
  List<Object> get props => [error];
}
