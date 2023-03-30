// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

class ApiKey {
  static const String baseUrl =
      "http://45.35.169.130:8765/BridgeForce_API_Test/api/";
  static const login = "user/authentication/login";
  static const String username = 'admin';
  static const String password = 'admin@123';
  static Map<String, dynamic> headers = {
    "authorization": 'Basic ' + base64Encode(utf8.encode('$username:$password'))
  };
}
