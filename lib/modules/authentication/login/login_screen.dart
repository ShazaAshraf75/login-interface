// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';
import 'package:login_interface/modules/authentication/login/widgets/login_screen_content.dart';
import 'package:login_interface/modules/authentication/widgets/custom_alert_dialog.dart';
import '../../home/home_screen.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSelected = false;
  String? usernameErrorMsg, passwordErrorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state is UsernameIsEmptyState) {
          usernameErrorMsg = "Username must not be empty";
        } else if (state is UsernameIsNotEmptyState) {
          usernameErrorMsg = null;
        }
        if (state is PasswordIsEmptyState) {
          passwordErrorMsg = "Password must not be empty";
        } else if (state is PasswordIsNotEmptyState) {
          passwordErrorMsg = null;
        } else if (state is LoginFormIsEmptyState) {
          usernameErrorMsg = "Username must not be empty";
          passwordErrorMsg = "Password must not be empty";
        } else if (state is ChangeCheckboxState) {
          isSelected = state.isSelected;
        } else if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (_) => const CustomAlertDialog(),
            barrierDismissible: false,
          );
        } else if (state is ValidToastState) {
          Fluttertoast.showToast(
              msg: state.loginModel.resultMessageEn.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 14.0);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(state.loginModel.data)));
        } else if (state is InvalidToastState) {
          Fluttertoast.showToast(
              msg: state.loginModel.resultMessageEn.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 14.0);
        }
      },
      builder: (context, state) {
        return LoginScreenContent(
            isSelected: isSelected,
            passwordErrorMsg: passwordErrorMsg,
            usernameErrorMsg: usernameErrorMsg,
            usernameController: usernameController,
            passwordController: passwordController);
      },
    );
  }
}
