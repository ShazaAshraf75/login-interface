import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_service.dart';
import 'package:login_interface/models/authentication_model/authentication_request_model.dart';
import 'package:login_interface/models/authentication_model/authentication_response_model.dart';
import 'package:login_interface/models/authentication_model/user_data_request_model.dart';
import 'package:login_interface/utils/network/dio_helper.dart';

class AuthenticationApiManager {
  AuthenticationApiService? authenticationApiService;
  AuthenticationResponseModel? authenticationResponseModel;

  Future loginApi(
    String? username,
    String? password,
    Function(AuthenticationResponseModel) apiSuccess,
    Function(AuthenticationResponseModel) apiFail,
    Function(String) apiNetworkFail,
  ) async {
    authenticationApiService = AuthenticationApiService(DioHelper.dio!);
    await authenticationApiService!
        .loginApi(AuthenticationRequestModel(
            userId: 0,
            ipAddress: "FUH0216913004222",
            deviceToken: "testtokens",
            osversion: "15.1",
            appVersion: "1",
            deviceType: "iOS",
            userDataRequestModel: UserDataRequestModel(
              userName: username,
              password: password,
            )))
        .then((value) {
      if (value.resultCode == 1) {
        apiSuccess(value);
      } else {
        apiFail(value);
      }
    }).catchError((onError) {
      apiNetworkFail(onError.toString());
    });
    return authenticationResponseModel;
  }
}
