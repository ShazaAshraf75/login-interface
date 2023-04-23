import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class ShopCustomBackButton extends StatelessWidget {
  const ShopCustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, bottom: 9, top: 9),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorManager.textColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            ImagePaths.back,
            colorFilter: const ColorFilter.mode(
                ColorManager.darkGreyColor, BlendMode.dst),
            fit: BoxFit.scaleDown,
          ),
        ));
  }
}
