import 'package:flutter/material.dart';
import 'package:login_interface/modules/survey/my_shops/details/widgets/shop_details_card_icon.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/status_widget.dart';
import 'package:login_interface/theme/color_manager.dart';

class ShopDetailsCard extends StatelessWidget {
  final String shopName;
  final String shopVisitedOnDate;
  final String shopEmail;
  final String shopPhoneNumber;
  final String shopStatus;

  const ShopDetailsCard(
      {super.key,
      required this.shopName,
      required this.shopVisitedOnDate,
      required this.shopEmail,
      required this.shopPhoneNumber,
      required this.shopStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 183,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shopName,
                    style: const TextStyle(
                        fontFamily: 'MontserratS',
                        color: ColorManager.darkGreyColor),
                  ),
                  Text(shopVisitedOnDate,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 12,
                          )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(shopEmail,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 12,
                                  )),
                      StatusWidget(status: shopStatus)
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(shopPhoneNumber,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 12,
                          )),
                ],
              ),
            ),
            const SizedBox(height: 6),
            const Divider(height: 0),
            SizedBox(
              height: 44,
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        ShopDetailsCardIcon(label: "Update shop"),
                        VerticalDivider(),
                        ShopDetailsCardIcon(label: "Update location"),
                        VerticalDivider(),
                        ShopDetailsCardIcon(label: "Get survey"),
                        VerticalDivider(),
                        ShopDetailsCardIcon(label: "Call"),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
