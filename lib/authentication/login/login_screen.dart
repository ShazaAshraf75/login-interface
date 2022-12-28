// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_interface/authentication/register/register_screen.dart';
import 'package:login_interface/authentication/widgets/account_widget.dart';
import 'package:login_interface/authentication/widgets/custom_button.dart';
import 'package:login_interface/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/authentication/widgets/dfms_widget.dart';
import 'package:login_interface/components/components.dart';
import 'package:login_interface/constants/constants.dart';
import 'package:login_interface/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                // fit: StackFit.expand,
                children: [
                  const DFMSwidget(),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.37,
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
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "MontserratS",
                              ),
                            ),
                            const SizedBox(height: 30),
                            Expanded(
                              child: Hero(
                                tag: "key1",
                                child: CustomTextField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.name,
                                  hintText: 'Username',
                                  suffixIcon: profile,
                                  func: (value) {
                                    if (value!.isEmpty) {
                                      return "Username must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscure: false,
                                  isSelected: false,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Hero(
                                tag: "key2",
                                child: CustomTextField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hintText: 'Password',
                                  obscure: true,
                                  suffixIcon: eye,
                                  func: (value) {
                                    if (value!.isEmpty) {
                                      return "Password must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  isSelected: true,
                                ),
                              ),
                            ),
                            // const SizedBox(height: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: isSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isSelected = value!;
                                      });
                                    },
                                    activeColor: darkPurpleColor,
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
                                  SizedBox(height: 30)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.31,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            text: 'Login',
                            width: MediaQuery.of(context).size.width * 0.7,
                            func: () {
                              formKey.currentState!.validate();
                            },
                          ),
                          AccountWidget(
                              question: "Don't Have an Account?",
                              answer: " Sign Up",
                              func: () {
                                Navigator.push(
                                    context, animateToRoute(RegisterScreen()));
                              }),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
