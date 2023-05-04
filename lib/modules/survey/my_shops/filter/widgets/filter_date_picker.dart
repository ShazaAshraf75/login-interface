// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login_interface/theme/color_manager.dart';

class FilterDatePicker extends StatelessWidget {
  TextEditingController controller;
  TextInputType? keyboardType;
  String hintText;
  String suffixIcon;
  String? Function(String?)? validator;

  Function()? onTap;
  FilterDatePicker({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.onTap,
    this.validator,
    this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var svgPicture = SvgPicture.asset(
      suffixIcon,
      colorFilter:
          const ColorFilter.mode(ColorManager.textColor, BlendMode.dst),
      fit: BoxFit.scaleDown,
      height: 24,
      width: 24,
    );

    return Material(
        color: Colors.transparent,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: true,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: ColorManager.textColor),
          onTap: onTap,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.datetime,
          decoration: InputDecoration(
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.textColor, width: .5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.textColor, width: .5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.textColor, width: .5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat',
                color: ColorManager.textColor),
            hintText: hintText,
            suffixIcon: svgPicture,
          ),
        ));
  }
}
