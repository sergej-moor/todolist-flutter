part of 'sign_up_form_bloc.dart';

//@immutable
//abstract class SignUpFormState {}

class SignUpFormState {
  final bool isSubmitting;
  final bool showValidationMessages;
  SignUpFormState({
    required this.isSubmitting,
    required this.showValidationMessages,
  });

  /** Die copyWith Funktion ermöglicht es beim aufrufen des Events später 
   * nicht immer alle Parameter angeben zu müssen, 
   * sondern nur die die sich verändert haben. Ist hier nicht so sinnvoll, 
   * aber bei vielen Parametern kann die die UI steuern kann es das 
   * durchaus sein */
  SignUpFormState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
  }) {
    return SignUpFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
    );
  }
}
