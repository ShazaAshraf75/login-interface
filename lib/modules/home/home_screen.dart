// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/models/login_model.dart';
import 'package:login_interface/theme/color_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.data, {super.key});
  LoginUserData? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.darkPurpleColor,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data!.username.toString()),
              Text(data!.userPhoneNumber.toString())
            ],
          ),
        ));
  }
}
