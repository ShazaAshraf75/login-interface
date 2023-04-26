// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:login_interface/theme/color_manager.dart';

class DefaultButton extends StatelessWidget {
  String text;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  void Function()? onTap;
  DefaultButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.width,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: width ?? double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                backgroundColor ?? ColorManager.darkPurpleColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: Text(text,
              style: TextStyle(
                fontFamily: "MontserratS",
                fontSize: 14,
                color: textColor ?? Colors.white,
              ))),
    );
  }
}
