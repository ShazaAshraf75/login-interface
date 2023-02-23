// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_interface/components/components.dart';
import 'package:login_interface/constants/constants.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_states.dart';
import 'package:login_interface/modules/authentication/register/register_screen.dart';
import 'package:login_interface/modules/authentication/widgets/account_widget.dart';
import 'package:login_interface/modules/authentication/widgets/custom_button.dart';
import 'package:login_interface/modules/authentication/widgets/custom_text_field.dart';
import 'package:login_interface/modules/authentication/widgets/dfms_widget.dart';
import 'package:login_interface/theme/colors.dart';

import '../../home/home_screen.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_events.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (context, state) {
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
        var bloc = BlocProvider.of<LoginBloc>(context);
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
                              suffixIcon: profile,
                              obscure: false,
                              isObscure: false,
                              formKey: form1Key,
                              func: (value) {
                                if (value!.isEmpty) {
                                  return "Username must not be empty";
                                } else {
                                  return null;
                                }
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
                              obscure: bloc.obscure,
                              suffixIcon: eye,
                              isObscure: true,
                              formKey: form2Key,
                              func: (value) {
                                if (value!.isEmpty) {
                                  return "Password must not be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: bloc.isSelected,
                                onChanged: (value) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      CheckboxValueChangedEvent(value: value));
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
                        if (state is! LoginLoadingState)
                          CustomButton(
                            text: 'Login',
                            width: MediaQuery.of(context).size.width * 0.7,
                            func: () {
                              if (form1Key.currentState!.validate() &&
                                  form2Key.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    UserLoggedInEvent(
                                        username: usernameController.text,
                                        password: passwordController.text));
                              }
                            },
                          )
                        else
                          Center(
                              child: CircularProgressIndicator(
                                  color: darkPurpleColor)),
                        AccountWidget(
                            question: "Don't Have an Account?",
                            answer: " Sign Up",
                            func: () {
                              Navigator.push(
                                  context, animateToRoute(RegisterScreen()));
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
