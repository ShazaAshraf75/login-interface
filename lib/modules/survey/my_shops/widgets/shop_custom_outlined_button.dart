import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/theme/color_manager.dart';

class ShopCustomOutlinedButton extends StatelessWidget {
  final String label;
  final String icon;
  final Function()? onPressed;

  const ShopCustomOutlinedButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton.icon(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ))),
          icon: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
                ColorManager.darkGreyColor, BlendMode.dst),
            fit: BoxFit.scaleDown,
            height: 24,
            width: 24,
          ),
          label: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorManager.darkGreyColor),
          )),
    );
  }
}
