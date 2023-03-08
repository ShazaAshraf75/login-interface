// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_interface/constants/constants.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';
import 'package:login_interface/modules/authentication/widgets/account_widget.dart';
import 'package:login_interface/modules/authentication/widgets/custom_alert_dialog.dart';
import 'package:login_interface/modules/authentication/widgets/custom_button.dart';
import 'package:login_interface/modules/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/modules/authentication/widgets/dfms_widget.dart';

import '../../home/home_screen.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_events.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();

  bool _isSelected = false;
  String? usernameErrorMsg;
  String? passwordErrorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state is UsernameIsEmptyState) {
          usernameErrorMsg = "Username must not be empty";
        } else {
          usernameErrorMsg = null;
        }
        if (state is PasswordIsEmptyState) {
          passwordErrorMsg = "Password must not be empty";
        } else {
          passwordErrorMsg = null;
        }
        if (state is ChangeCheckboxState) {
          _isSelected = state.isSelected;
        }
        if (state is LoginSuccessState) {
          if (state.loginModel.resultCode == 1) {
            Fluttertoast.showToast(
                msg: state.loginModel.resultMessageEn.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 14.0);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(state.loginModel.data)));
          } else {
            Fluttertoast.showToast(
                msg: state.loginModel.resultMessageEn.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  const DFMSwidget(),
                  Positioned(
                    // top: MediaQuery.of(context).size.height * 0.23,
                    top: 180,
                    width: MediaQuery.of(context).size.width * 1,
                    height: 360,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 24,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "MontserratS",
                            ),
                          ),
                          const SizedBox(height: 30),
                          Hero(
                            tag: "key1",
                            child: CustomTextField(
                              controller: usernameController,
                              keyboardType: TextInputType.name,
                              hintText: 'Username',
                              suffixIcon: ImagePaths.profile,
                              isObscure: false,
                              obscure: false,
                              errorText: usernameErrorMsg,
                              onChange: (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    UsernameValidatedEvent(username: value));
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Hero(
                            tag: "key2",
                            child: CustomTextField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: 'Password',
                              suffixIcon: ImagePaths.eye,
                              isObscure: true,
                              obscure: true,
                              errorText: passwordErrorMsg,
                              onChange: (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    PasswordValidatedEvent(password: value));
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isSelected,
                                onChanged: (value) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      CheckboxValueChangedEvent(value: value!));
                                },
                                activeColor: ColorManager.darkPurpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                side: BorderSide(
                                  color: Color.fromRGBO(201, 201, 201, 1),
                                ),
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    fontFamily: "Montserrat", fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // top: MediaQuery.of(context).size.height * 0.59,
                    top: 520,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          text: 'Login',
                          width: MediaQuery.of(context).size.width * 0.7,
                          onTap: () => BlocProvider.of<LoginBloc>(context).add(
                              UserLoggedInEvent(
                                  username: usernameController.text,
                                  password: passwordController.text)),
                        ),
                        if (state is LoginLoadingState)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: 5,
                              width: MediaQuery.of(context).size.width * 0.66,
                              child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey[300],
                                  color: ColorManager.darkPurpleColor),
                            ),
                          ),
                        AccountWidget(
                            question: "Don't Have an Account?",
                            answer: " Sign Up",
                            onTap: () {
                              // Navigator.push(
                              //     context, animateToRoute(RegisterScreen()));
                              showDialog(
                                context: context,
                                builder: (_) => const CustomAlertDialog(),
                                barrierDismissible: false,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}