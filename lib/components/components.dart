import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:login_interface/theme/colors.dart';

Widget dfmsWidget(context) => Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              darkPurpleColor,
              redColor,
            ],
          )),
      child: const Center(
        child: Text(
          "DFMS",
          style: TextStyle(
              fontFamily: "MontserratB", color: Colors.white, fontSize: 45),
        ),
      ),
    );
Widget customTextField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String hintText,
  required String suffixIcon,
  required String? Function(String?)? func,
  bool obscure = false,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: func,
        obscureText: obscure,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: lightGreyColor,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: lightGreyColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: lightGreyColor)),
          border: InputBorder.none,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          contentPadding: const EdgeInsets.all(12),
          hintStyle: TextStyle(
              fontSize: 13, fontFamily: 'Montserrat', color: textColor),
          hintText: hintText,
          suffixIcon: SvgPicture.asset(
            suffixIcon,
            color: textColor,
            fit: BoxFit.scaleDown,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
Widget customButton({
  required String text,
}) =>
    SizedBox(
      height: 44,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
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
Widget accountWidget(
        {required String question,
        required String answer,
        required void Function()? func}) =>
    Row(
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
