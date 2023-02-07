// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login_interface/theme/colors.dart';

import '../login/bloc/login_bloc.dart';
import '../login/bloc/login_states.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hintText;
  String suffixIcon;
  String? Function(String?)? func;
  bool obscure = false;
  bool isObscure = false;
  GlobalKey<FormState> formKey;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.suffixIcon,
    required this.func,
    required this.obscure,
    required this.isObscure,
    required this.formKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        var bloc = LoginBloc.get(context);
        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Material(
              color: Colors.transparent,
              child: TextFormField(
                validator: func,
                obscureText: obscure,
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintStyle: TextStyle(
                      fontSize: 13, fontFamily: 'Montserrat', color: textColor),
                  hintText: hintText,
                  suffixIcon: (isObscure == false)
                      ? SvgPicture.asset(
                          suffixIcon,
                          color: textColor,
                          fit: BoxFit.scaleDown,
                          height: 24,
                          width: 24,
                        )
                      : IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            bloc.changePasswordVisibility();
                          },
                          icon: (bloc.obscure)
                              ? SvgPicture.asset(
                                  suffixIcon,
                                  color: textColor,
                                  fit: BoxFit.scaleDown,
                                  height: 24,
                                  width: 24,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: textColor,
                                ),
                        ),
                ),
              )),
        );
      },
    );
  }
}
