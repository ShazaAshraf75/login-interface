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
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Partner:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        partner,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Channel Type:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        channelType,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Visited By:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        visitedBy,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Owner:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        owner,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Code:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        code,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Visited On:",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              color: ColorManager.textColor,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        visitedOn,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
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
            const SizedBox(width: 10),
            Text(
              location,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ]),
    );
  }
}
