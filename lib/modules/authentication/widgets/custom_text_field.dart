// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hintText;
  String suffixIcon;
  String? Function(String?)? onTap;
  bool obscure = false;
  bool isObscure = false;
  GlobalKey<FormState> formKey;
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.suffixIcon,
    required this.onTap,
    required this.obscure,
    required this.isObscure,
    required this.formKey,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    var svgPicture = SvgPicture.asset(
      widget.suffixIcon,
      colorFilter:
          const ColorFilter.mode(ColorManager.textColor, BlendMode.dst),
      fit: BoxFit.scaleDown,
      height: 24,
      width: 24,
    );

    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Material(
          color: Colors.transparent,
          child: TextFormField(
            validator: widget.onTap,
            obscureText: widget.obscure,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintStyle: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  color: ColorManager.textColor),
              hintText: widget.hintText,
              suffixIcon: (widget.isObscure == false)
                  ? svgPicture
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
                              colorFilter: const ColorFilter.mode(
                                  ColorManager.textColor, BlendMode.dst),
                              fit: BoxFit.scaleDown,
                              height: 24,
                              width: 24,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: ColorManager.textColor,
                            ),
                    ),
            ),
          )),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////
class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hintText;
  String suffixIcon;
  bool obscure = false;
  bool isObscure = false;
  String? errorText;
  Function(String)? onChange;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.suffixIcon,
    required this.obscure,
    required this.onChange,
    required this.isObscure,
    required this.errorText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    var svgPicture = SvgPicture.asset(
      widget.suffixIcon,
      colorFilter:
          const ColorFilter.mode(ColorManager.textColor, BlendMode.dst),
      fit: BoxFit.scaleDown,
      height: 24,
      width: 24,
    );
    return Material(
        color: Colors.transparent,
        child: TextField(
          onChanged: widget.onChange,
          obscureText: widget.obscure,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            errorText: widget.errorText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat',
                color: ColorManager.textColor),
            hintText: widget.hintText,
            suffixIcon: (widget.isObscure == false)
                ? svgPicture
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
                            colorFilter: const ColorFilter.mode(
                                ColorManager.textColor, BlendMode.dst),
                            fit: BoxFit.scaleDown,
                            height: 24,
                            width: 24,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: ColorManager.textColor,
                          ),
                  ),
          ),
        ));
  }
}
