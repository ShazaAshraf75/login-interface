// ignore_for_file: unused_local_variable

import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_manager.dart';
import 'package:login_interface/models/authentication_response_model.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';

class LoginRepository {
  final AuthenticationApiManager authenticationApiManager;

  LoginRepository({
    required this.authenticationApiManager,
  });

  Future<LoginStates> loginApi({
    required String? username,
    required String? password,
  }) async {
    LoginStates? authenticationState;
    AuthenticationResponseModel? authenticationResponseModel;

    await authenticationApiManager.loginApi(
      username,
      password,
      (AuthenticationResponseModel response) {
        authenticationResponseModel = response;
        authenticationState =
            LoginApiSuccessState(responseModel: authenticationResponseModel!);
      },
      (AuthenticationResponseModel response) {
        authenticationState =
            LoginApiFailState(response.resultMessageEn.toString());
      },
      (error) {
        authenticationState = LoginNetworkFailState(error);
      },
    );

    if (authenticationState is LoginApiSuccessState) {
      authenticationState =
          ValidToastState(responseModel: authenticationResponseModel!);
    } else if (authenticationState is LoginApiFailState) {
      authenticationState =
          InvalidToastState(responseModel: authenticationResponseModel!);
    }
    return authenticationState!;
  }
}
