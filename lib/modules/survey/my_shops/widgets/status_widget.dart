import 'package:flutter/material.dart';
import 'package:login_interface/theme/color_manager.dart';

class StatusWidget extends StatelessWidget {
  final String status;

  const StatusWidget({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 27,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorManager.greenColor,
          borderRadius: BorderRadius.circular(15)),
      child: Text(status,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 11,
                color: Colors.white,
              )),
    );
  }
}
