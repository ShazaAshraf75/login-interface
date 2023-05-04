// ignore_for_file: unused_local_variable

import 'package:login_interface/data/data_source/local/shared_prefrences/cache_helper.dart';
import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_manager.dart';
import 'package:login_interface/models/authentication_model/authentication_response_model.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';

class LoginRepository {
  AuthenticationApiManager? authenticationApiManager =
      AuthenticationApiManager();

  Future<LoginStates> loginApi({
    required String? username,
    required String? password,
  }) async {
    LoginStates? authenticationState;
    AuthenticationResponseModel? authenticationResponseModel;

    await authenticationApiManager!.loginApi(username, password,
        (AuthenticationResponseModel response) {
      authenticationResponseModel = response;
      authenticationState =
          LoginApiSuccessState(responseModel: authenticationResponseModel!);
    }, (AuthenticationResponseModel response) {
      authenticationResponseModel = response;
      authenticationState = LoginApiFailState(
          message: authenticationResponseModel!.resultMessageEn.toString());
    }, (error) {
      authenticationState = LoginNetworkFailState(error);
    });

    if (authenticationState is LoginApiSuccessState) {
      authenticationState =
          ValidToastState(responseModel: authenticationResponseModel!);
    } else if (authenticationState is LoginApiFailState) {
      authenticationState = InvalidToastState(
          message: authenticationResponseModel!.resultMessageEn.toString());
    }
    return authenticationState!;
  }
}
