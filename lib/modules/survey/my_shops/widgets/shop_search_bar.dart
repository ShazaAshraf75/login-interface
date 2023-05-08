// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/theme/color_manager.dart';

class ShopSearchBar extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hintText;
  String prefixIcon;
  Function(String)? onChange;
  void Function()? onClearPressed;
  ShopSearchBar({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    required this.onChange,
    required this.onClearPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var svgPicture = SvgPicture.asset(
      prefixIcon,
      colorFilter: const ColorFilter.mode(
          ColorManager.searchBarTextColor, BlendMode.dst),
      fit: BoxFit.scaleDown,
      height: 32,
      width: 32,
    );
    return Material(
        color: Colors.transparent,
        child: TextField(
          onChanged: onChange,
          controller: controller,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.labelLarge,
          decoration: InputDecoration(
              fillColor: ColorManager.searchBarBackgroundColor,
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: onClearPressed,
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: ColorManager.darkGreyColor,
                      ))
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorManager.searchBarTextColor),
              hintText: hintText,
              prefixIcon: svgPicture),
        ));
  }
}
