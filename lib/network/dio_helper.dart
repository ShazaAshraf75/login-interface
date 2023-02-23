// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String _username = 'admin';
  static const String _password = 'admin@123';
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: "http://45.35.169.130:8765/BridgeForce_API_Test/api/",
          receiveDataWhenStatusError: true,
          headers: {
            "authorization":
                'Basic ' + base64Encode(utf8.encode('$_username:$_password'))
          }),
    );
  }

  static Future<Response> postData(
      {required String url, required Map<String, dynamic> data}) async {
    return await dio.post(url, data: data);
  }
}
