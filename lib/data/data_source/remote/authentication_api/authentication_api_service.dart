// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:login_interface/data/data_source/remote/api_key.dart';
import 'package:login_interface/models/authentication_request_model.dart';
import 'package:login_interface/models/authentication_response_model.dart';
import 'package:retrofit/http.dart';

part 'authentication_api_service.g.dart';

@RestApi(baseUrl:ApiKey.baseUrl )
abstract class AuthenticationApiService {
  factory AuthenticationApiService(Dio dio, {required String baseUrl}) {
    dio.options = BaseOptions(headers: ApiKey.headers);

    return _AuthenticationApiService(dio, baseUrl: baseUrl);
  }

  @POST(ApiKey.login)
  Future<AuthenticationResponseModel> loginApi(
      @Body() AuthenticationRequestModel? respone);
}
