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

class ChangePasswordVisibilityState extends LoginStates {}

class ChangeCheckboxState extends LoginStates {}
