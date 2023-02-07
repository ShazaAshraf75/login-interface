// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_interface/theme/colors.dart';

class AccountWidget extends StatelessWidget {
  String question;
  String answer;
  void Function()? func;
  AccountWidget({
    Key? key,
    required this.question,
    required this.answer,
    this.func,
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
          onPressed: func,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(0, 0)),
          ),
          child: Text(
            answer,
            style: TextStyle(
                fontFamily: "Montserrat", fontSize: 13, color: redColor),
          ),
        )
      ],
    );
  }
}
