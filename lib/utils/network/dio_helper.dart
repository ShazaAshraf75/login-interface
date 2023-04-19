import 'package:dio/dio.dart';
import 'package:login_interface/data/data_source/remote/api_key.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiKey.baseUrl,
      headers: ApiKey.headers,
    ));
  }
}
