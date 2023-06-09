  abstract class FormSubmissionStatus {
    const FormSubmissionStatus();
  }

  class InitialFormStatus extends FormSubmissionStatus {
    const InitialFormStatus();
  }

  class FormSubmitting extends FormSubmissionStatus {}

  class SubmisssionSuccess extends FormSubmissionStatus {}

  class SubmisssionFailed extends FormSubmissionStatus {
    final Exception exception;
    final String errorMessage;

    SubmisssionFailed(this.exception, {this.errorMessage = 'Đăng nhập thất bại'});
  }
