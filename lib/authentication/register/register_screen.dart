// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/authentication/login/login_screen.dart';
import 'package:login_interface/authentication/widgets/account_widget.dart';
import 'package:login_interface/authentication/widgets/custom_button.dart';
import 'package:login_interface/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/components/components.dart';
import 'package:login_interface/constants/constants.dart';

import '../widgets/dfms_widget.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();
  var form3Key = GlobalKey<FormState>();
  var form4Key = GlobalKey<FormState>();
  var form5Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              fit: StackFit.loose,
              children: [
                const DFMSwidget(),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.58,
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "MontserratS",
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: form1Key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Expanded(
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
                              isObscure: false,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Form(
                          key: form2Key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Expanded(
                            child: Hero(
                              tag: "key1",
                              child: CustomTextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Email Address',
                                suffixIcon: email,
                                func: (value) {
                                  if (value!.isEmpty) {
                                    return "Email must not be empty";
                                  } else if (!value.contains("@") &&
                                      !value.contains(".")) {
                                    return "Invalid Email Address";
                                  } else {
                                    return null;
                                  }
                                },
                                obscure: false,
                                isObscure: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Form(
                          key: form3Key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Expanded(
                            child: Hero(
                              tag: "key2",
                              child: CustomTextField(
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                hintText: 'Mobile Number',
                                suffixIcon: phone,
                                func: (value) {
                                  if (value!.isEmpty) {
                                    return "Mobile Number must not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                obscure: false,
                                isObscure: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Form(
                          key: form4Key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Expanded(
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
                              isObscure: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Form(
                          key: form5Key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Expanded(
                            child: CustomTextField(
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: 'Confirm Password',
                              obscure: true,
                              suffixIcon: eye,
                              func: (value) {
                                if (value!.isEmpty) {
                                  return "Password must not be empty";
                                } else {
                                  return null;
                                }
                              },
                              isObscure: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.11,
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'Sign Up',
                          width: MediaQuery.of(context).size.width * 0.7,
                          func: () {
                            form1Key.currentState!.validate();
                            form2Key.currentState!.validate();
                            form3Key.currentState!.validate();
                            form4Key.currentState!.validate();
                            form5Key.currentState!.validate();
                          },
                        ),
                        AccountWidget(
                            question: "Already Have an Account?",
                            answer: "Login",
                            func: () {
                              Navigator.push(
                                  context, animateToRoute(LoginScreen()));
                            }),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
