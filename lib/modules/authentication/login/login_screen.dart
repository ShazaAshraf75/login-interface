// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';
import 'package:login_interface/modules/authentication/login/widgets/login_screen_content.dart';
import 'package:login_interface/modules/authentication/widgets/custom_alert_dialog.dart';
import 'package:login_interface/modules/survey/shared/navigation/navigation_screen.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSelected = false;
  bool flag = false;

  String? usernameErrorMsg, passwordErrorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state is UsernameIsEmptyState) {
          usernameErrorMsg = "Username is required";
        } else if (state is UsernameIsNotEmptyState) {
          usernameErrorMsg = null;
        }
        if (state is PasswordIsEmptyState) {
          passwordErrorMsg = "Password is required";
        } else if (state is PasswordIsNotEmptyState) {
          passwordErrorMsg = null;
        } else if (state is LoginFormIsEmptyState) {
          usernameErrorMsg = "Username is required";
          passwordErrorMsg = "Password is required";
        } else if (state is ChangeCheckboxState) {
          isSelected = state.isSelected;
        } else if (state is LoginNetworkFailState) {
          showDialog(
            context: context,
            builder: (_) => const CustomAlertDialog(),
            barrierDismissible: false,
          );
        } else if (state is LoginApiSuccessState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NavigationScreen()));
        } else if (state is InvalidToastState) {
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 14.0);
        } else if (state is LoginLoadingState) {
          flag = true;
        } else if (state is! LoginLoadingState) {
          flag = false;
        }
      },
      builder: (context, state) {
        return LoginScreenContent(
          isSelected: isSelected,
          flag: flag,
          passwordErrorMsg: passwordErrorMsg,
          usernameErrorMsg: usernameErrorMsg,
          usernameController: usernameController,
          passwordController: passwordController,
        );
      },
    );
  }
}
