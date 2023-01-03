// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login_interface/theme/colors.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Material(
          color: Colors.transparent,
          child: TextFormField(
            validator: widget.func,
            obscureText: widget.obscure,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintStyle: TextStyle(
                  fontSize: 13, fontFamily: 'Montserrat', color: textColor),
              hintText: widget.hintText,
              suffixIcon: (widget.isObscure == false)
                  ? SvgPicture.asset(
                      widget.suffixIcon,
                      color: textColor,
                      fit: BoxFit.scaleDown,
                      height: 24,
                      width: 24,
                    )
                  : IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          widget.obscure = !widget.obscure;
                        });
                      },
                      icon: (widget.obscure)
                          ? SvgPicture.asset(
                              widget.suffixIcon,
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
  }
}