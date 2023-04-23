import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class ShopDetailsBody extends StatelessWidget {
  final String partner;
  final String channelType;
  final String visitedBy;
  final String owner;
  final String code;
  final String visitedOn;
  final String location;

  const ShopDetailsBody(
      {super.key,
      required this.partner,
      required this.channelType,
      required this.visitedBy,
      required this.owner,
      required this.code,
      required this.visitedOn,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Details",
          style: TextStyle(
              fontFamily: "MontserratS", color: ColorManager.darkGreyColor),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Partner:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  "Channel Type:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  "Visited By:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partner,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  channelType,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  visitedBy,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Owner:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  "Code:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  "Visited On:",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: ColorManager.textColor,
                      ),
                ),
                const SizedBox(height: 13),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  code,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
                Text(
                  visitedOn,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 13),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.lightPinkColor),
              child: SvgPicture.asset(
                ImagePaths.redLocation,
                fit: BoxFit.scaleDown,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 12,
                  ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ]),
    );
  }
}
