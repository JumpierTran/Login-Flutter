import 'package:camera_app/auth/form_submission_status.dart';

class LoginState {
  final String phone;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState({
    this.phone = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? phone,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
