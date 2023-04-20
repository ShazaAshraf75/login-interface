import 'package:login_interface/models/authentication_model/authentication_response_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginNotLoadingState extends LoginStates {}

class LoginApiSuccessState extends LoginStates {
  final AuthenticationResponseModel responseModel;
  LoginApiSuccessState({
    required this.responseModel,
  });
}

class LoginApiFailState extends LoginStates {
  final String message;
  LoginApiFailState({required this.message});
}

class LoginNetworkFailState extends LoginStates {
  final String error;
  LoginNetworkFailState(this.error);
}

class ChangeCheckboxState extends LoginStates {
  final bool isSelected;

  ChangeCheckboxState({required this.isSelected});
}

class UsernameIsEmptyState extends LoginStates {}

class UsernameIsNotEmptyState extends LoginStates {}

class PasswordIsEmptyState extends LoginStates {}

class PasswordIsNotEmptyState extends LoginStates {}

class LoginFormIsEmptyState extends LoginStates {}

class ValidToastState extends LoginStates {
  final AuthenticationResponseModel responseModel;
  ValidToastState({
    required this.responseModel,
  });
}

class InvalidToastState extends LoginStates {
  final String message;
  InvalidToastState({
    required this.message,
  });
}
