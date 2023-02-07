// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/theme/colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  double width;
  void Function()? func;
  CustomButton(
      {Key? key, required this.text, required this.width, required this.func})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: width,
      child: ElevatedButton(
          onPressed: func,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(darkPurpleColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontFamily: "Montserrat", fontSize: 14),
          )),
    );
  }
}
