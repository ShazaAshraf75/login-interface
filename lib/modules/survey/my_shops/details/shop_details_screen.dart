import 'package:flutter/material.dart';
import 'package:login_interface/modules/survey/my_shops/details/widgets/shop_details_body.dart';
import 'package:login_interface/modules/survey/my_shops/details/widgets/shop_details_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_back_button.dart';

class ShopDetailsScreen extends StatelessWidget {
  const ShopDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Shop Name"),
        leading: const ShopCustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ShopDetailsCard(
                shopName: "shopName",
                shopVisitedOnDate: "shopVisitedOnDate",
                shopEmail: "shopEmail",
                shopPhoneNumber: "shopPhoneNumber",
                shopStatus: "Open"),
            SizedBox(height: 24),
            ShopDetailsBody(
                partner: "partner",
                channelType: "channelType",
                visitedBy: "visitedBy",
                owner: "owner",
                code: "code",
                visitedOn: "visitedOn",
                location: "Kuwait-Hawally"),
          ],
        ),
      ),
    );
  }
}
