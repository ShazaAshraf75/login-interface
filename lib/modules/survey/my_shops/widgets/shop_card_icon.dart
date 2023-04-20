import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopCardIcon extends StatelessWidget {
  final String icon;
  final Function() onTap;

  const ShopCardIcon({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 44,
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
