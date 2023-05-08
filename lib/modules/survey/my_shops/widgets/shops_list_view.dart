import 'package:flutter/material.dart';

import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/details/shop_details_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card.dart';
import 'package:login_interface/utils/date_format/date_format.dart';

class ShopsListView extends StatelessWidget {
  final bool flag;
  final List<ShopsDataResponseModel> item;
  const ShopsListView({
    Key? key,
    required this.flag,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => flag == true
      ? const Center(child: CircularProgressIndicator())
      : ListView.separated(
          itemCount: item.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return ShopCard(
              shopName: item[index].shopNameEn!,
              visitedByName: item[index].shopLastVistedBy!,
              visitedOnDate: dateFormat(item[index].shopLastVisitedDate!),
              shopLocation: '${item[index].shopRegionEn!}'
                  ' - ${item[index].shopAreaEn!}',
              shopStatus: item[index].shopStatusEn!,
              onCardPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShopDetailsScreen(
                            item: item[index],
                          ))),
              onUpdatePressed: () {},
              onLocationPressed: () {},
              onSurveyPressed: () {},
              onCallPressed: () {},
            );
          });
}
