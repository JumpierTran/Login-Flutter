abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterEmptyFailure extends RegisterState {
  final String errorMessage;

  RegisterEmptyFailure(this.errorMessage);
}
