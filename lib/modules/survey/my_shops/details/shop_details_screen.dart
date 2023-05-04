import 'package:flutter/material.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/details/widgets/shop_details_body.dart';
import 'package:login_interface/modules/survey/my_shops/details/widgets/shop_details_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_back_button.dart';
import 'package:login_interface/utils/date_format/date_format.dart';

class ShopDetailsScreen extends StatelessWidget {
  final ShopsDataResponseModel item;

  const ShopDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(item.shopNameEn.toString()),
        leading: const ShopCustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShopDetailsCard(
                shopName: item.shopNameEn.toString(),
                shopVisitedOnDate:
                    dateFormat(item.shopLastVisitedDate.toString()),
                shopEmail: "shazaashraf75@gmail.com",
                shopPhoneNumber: item.shopPhone.toString(),
                shopStatus: item.shopStatusEn.toString()),
            const SizedBox(height: 24),
            ShopDetailsBody(
              partner: item.shopPartnerEn.toString(),
              channelType: item.shopChannelTypeFkId.toString(),
              visitedBy: item.shopLastVistedBy.toString(),
              owner: item.shopOwner.toString(),
              code: item.shopCode.toString(),
              visitedOn: dateFormat(item.shopLastVisitedDate.toString()),
              location: '${item.shopRegionEn.toString()}'
                  ' - ${item.shopAreaEn.toString()}',
            ),
          ],
        ),
      ),
    );
  }
}
