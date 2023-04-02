// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:login_interface/modules/authentication/login/bloc/login_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_events.dart';
import 'package:login_interface/modules/authentication/widgets/account_widget.dart';
import 'package:login_interface/modules/authentication/widgets/custom_button.dart';
import 'package:login_interface/modules/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/modules/authentication/widgets/dfms_widget.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class LoginScreenContent extends StatelessWidget {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool flag;
  bool isSelected;
  String? usernameErrorMsg, passwordErrorMsg;
  LoginScreenContent(
      {Key? key,
      required this.isSelected,
      required this.flag,
      required this.passwordErrorMsg,
      required this.usernameErrorMsg,
      required this.usernameController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
                            BlocProvider.of<LoginBloc>(context)
                                .add(UsernameValidatedEvent(username: value));
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
                            BlocProvider.of<LoginBloc>(context)
                                .add(PasswordValidatedEvent(password: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  CheckboxValueChangedEvent(value: value!));
                            },
                            activeColor: ColorManager.darkPurpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: const BorderSide(
                              color: Color.fromRGBO(201, 201, 201, 1),
                            ),
                          ),
                          const Text(
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
                        onTap: () {
                          BlocProvider.of<LoginBloc>(context).add(
                              UserLoggedInEvent(
                                  username: usernameController.text,
                                  password: passwordController.text));
                        }),
                    AccountWidget(
                        question: "Don't Have an Account?",
                        answer: " Sign Up",
                        onTap: () {
                          // Navigator.push(
                          //     context, animateToRoute(RegisterScreen()));
                        }),
                  ],
                ),
              ),
              if (flag == true)
                Container(
                  color: Colors.transparent,
                  child: const Center(
                      child: CircularProgressIndicator(
                          color: ColorManager.darkPurpleColor)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
