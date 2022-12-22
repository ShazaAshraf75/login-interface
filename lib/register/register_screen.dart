// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/components/components.dart';
import 'package:login_interface/constants/constants.dart';
import 'package:login_interface/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        dfmsWidget(context),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "MontserratS",
                  ),
                ),
                const SizedBox(height: 30),
                customTextField(
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
                    }),
                customTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email Address',
                    suffixIcon: email,
                    func: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be empty";
                      } else if (!value.contains("@") && !value.contains(".")) {
                        return "Invalid Email Address";
                      } else {
                        return null;
                      }
                    }),
                customTextField(
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
                    }),
                customTextField(
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
                    }),
                customTextField(
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
                    }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: customButton(text: 'Sign Up'),
        ),
        accountWidget(
            question: "Already Have an Account?",
            answer: "Login",
            func: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            })
      ],
    ));
  }
}
