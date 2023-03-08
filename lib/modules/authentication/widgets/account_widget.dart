// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/constants/constants.dart';

class AccountWidget extends StatelessWidget {
  String question;
  String answer;
  void Function()? onTap;
  AccountWidget({
    Key? key,
    required this.question,
    required this.answer,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
          ),
        ),
        TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(0, 0)),
          ),
          child: Text(
            answer,
            style: const TextStyle(
                fontFamily: "Montserrat", fontSize: 13, color: ColorManager.redColor),
          ),
        )
      ],
    );
  }
}
