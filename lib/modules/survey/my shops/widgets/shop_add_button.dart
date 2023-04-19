// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:login_interface/theme/color_manager.dart';

class ShopAddButton extends StatelessWidget {
  void Function()? onPressed;
  ShopAddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: MaterialButton(
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: ColorManager.redColor,
          onPressed: onPressed,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ));
  }
}
