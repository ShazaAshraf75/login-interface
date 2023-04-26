// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:login_interface/components/components.dart';
import 'package:login_interface/modules/authentication/login/login_screen.dart';
import 'package:login_interface/modules/authentication/widgets/account_widget.dart';
import 'package:login_interface/modules/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

import '../../widgets/default_button.dart';
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
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: [
            const DFMSwidget(),
            Positioned(
              // top: MediaQuery.of(context).size.height * 0.23,
              top: 180,
              width: MediaQuery.of(context).size.width * 1,
              height: 570,
              child: Container(
                // alignment: Alignment.center,
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
                    const Spacer(),
                    // const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: usernameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Username',
                      suffixIcon: ImagePaths.profile,
                      obscure: false,
                      isObscure: false,
                      formKey: form1Key,
                      onTap: (value) {
                        if (value!.isEmpty) {
                          return "Username must not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Hero(
                      tag: "key1",
                      child: CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email Address',
                        suffixIcon: ImagePaths.email,
                        obscure: false,
                        isObscure: false,
                        formKey: form2Key,
                        onTap: (value) {
                          if (value!.isEmpty) {
                            return "Email must not be empty";
                          } else if (!value.contains("@") &&
                              !value.contains(".")) {
                            return "Invalid Email Address";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Hero(
                      tag: "key2",
                      child: CustomTextFormField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        hintText: 'Mobile Number',
                        suffixIcon: ImagePaths.phone,
                        obscure: false,
                        isObscure: false,
                        formKey: form3Key,
                        onTap: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number must not be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      obscure: true,
                      suffixIcon: ImagePaths.eye,
                      isObscure: true,
                      formKey: form4Key,
                      onTap: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Confirm Password',
                      obscure: true,
                      suffixIcon: ImagePaths.eye,
                      isObscure: true,
                      formKey: form5Key,
                      onTap: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    // const SizedBox(height: 10),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Positioned(
              // top: MediaQuery.of(context).size.height * 0.82,
              top: 725,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                    text: 'Sign Up',
                    width: MediaQuery.of(context).size.width * 0.7,
                    onTap: () {
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
                      onTap: () {
                        Navigator.push(context, animateToRoute(LoginScreen()));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
