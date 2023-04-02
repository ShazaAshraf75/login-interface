// // ignore_for_file: avoid_print

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:login_interface/data/data_source/remote/api_key.dart';
// import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_service.dart';
// import 'package:login_interface/models/authentication_request_model.dart';
// import 'package:login_interface/models/authentication_response_model.dart';
// import 'package:login_interface/models/user_data_request_model.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: _buildBody(context),
//     );
//   }
// }

// FutureBuilder<AuthenticationResponseModel> _buildBody(BuildContext context) {
//   Dio dio = Dio();
//   dio.options.headers = ApiKey.headers;
//   var client = AuthenticationApiService(dio, baseUrl: ApiKey.baseUrl);

//   return FutureBuilder<AuthenticationResponseModel>(
//     future: client.loginApi(AuthenticationRequestModel(
//         userId: 0,
//         ipAddress: "FUH0216913004222",
//         deviceToken: "testtokens",
//         osversion: "15.1",
//         appVersion: "1",
//         deviceType: "iOS",
//         userDataRequestModel: UserDataRequestModel(
//           userName: "ss",
//           password: "admin@123",
//         ))),
//     builder: (context, snapshot) {
//       final data = snapshot.data!;

//       if (snapshot.connectionState == ConnectionState.done) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(child: Text(data.resultCode!.toString())),
//             Center(child: Text(data.resultMessageEn!)),
//             // Center(child: Text(data.userDataResponseModel!.userName!)),
//             // Center(child: Text(data.userDataResponseModel!.userPhoneNumber!)),
//           ],
//         );
//       } else {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     },
//   );
// }
