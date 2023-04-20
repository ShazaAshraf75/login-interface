import 'package:flutter/material.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card_icon.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class ShopCard extends StatelessWidget {
  final String shopName;
  final String visitedByName;
  final String visitedOnDate;
  final String shopLocation;
  final String shopStatus;
  final Function() onCardPressed;
  final Function() onUpdatePressed;
  final Function() onLocationPressed;
  final Function() onSurveyPressed;
  final Function() onCallPressed;

  const ShopCard(
      {super.key,
      required this.shopName,
      required this.visitedByName,
      required this.visitedOnDate,
      required this.shopLocation,
      required this.shopStatus,
      required this.onCardPressed,
      required this.onUpdatePressed,
      required this.onLocationPressed,
      required this.onSurveyPressed,
      required this.onCallPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 210,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46.5,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: ColorManager.lightGreyColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Text(
                  shopName,
                  style: const TextStyle(
                      fontFamily: 'MontserratS',
                      color: ColorManager.darkGreyColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Visited by:",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorManager.textColor,
                                    fontSize: 12,
                                  ),
                        ),
                        const SizedBox(width: 18),
                        Text(visitedByName,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 12,
                                )),
                        const Spacer(),
                        Container(
                          width: 48,
                          height: 27,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.greenColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(shopStatus,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 11,
                                    color: Colors.white,
                                  )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "Visited on:",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorManager.textColor,
                                    fontSize: 12,
                                  ),
                        ),
                        const SizedBox(width: 18),
                        Text(visitedOnDate,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 12,
                                )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(shopLocation,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                            )),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Divider(height: 0),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShopCardIcon(
                        icon: ImagePaths.update, onTap: onUpdatePressed),
                    const VerticalDivider(),
                    ShopCardIcon(
                        icon: ImagePaths.location, onTap: onLocationPressed),
                    const VerticalDivider(),
                    ShopCardIcon(
                        icon: ImagePaths.survey, onTap: onSurveyPressed),
                    const VerticalDivider(),
                    ShopCardIcon(icon: ImagePaths.call, onTap: onCallPressed),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
