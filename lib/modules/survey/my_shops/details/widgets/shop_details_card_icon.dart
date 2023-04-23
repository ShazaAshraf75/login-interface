import 'package:flutter/material.dart';
import 'package:login_interface/theme/color_manager.dart';

class ShopDetailsCardIcon extends StatelessWidget {
  final String label;

  const ShopDetailsCardIcon({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 12,
          color: ColorManager.darkPurpleColor,
          fontWeight: FontWeight.bold),
    );
  }
}
