import 'package:login_interface/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  late LoginModel loginModel;
  LoginSuccessState({
    required this.loginModel,
  });
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ChangeCheckboxState extends LoginStates {
  final bool isSelected;

  ChangeCheckboxState({required this.isSelected});
}

class UsernameIsEmptyState extends LoginStates {}

class UsernameIsNotEmptyState extends LoginStates {}

class PasswordIsEmptyState extends LoginStates {}

class PasswordIsNotEmptyState extends LoginStates {}
