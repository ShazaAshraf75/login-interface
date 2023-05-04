import 'package:flutter/material.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/details/shop_details_screen.dart';
import 'package:login_interface/modules/survey/my_shops/filter/filter_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_add_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_outlined_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_search_bar.dart';
import 'package:login_interface/utils/date_format/date_format.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class MyShopsContent extends StatelessWidget {
  final TextEditingController searchController;
  final List<ShopsDataResponseModel> allShopsList;
  final bool flag;

  const MyShopsContent(
      {super.key,
      required this.searchController,
      required this.allShopsList,
      required this.flag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("My Shops"),
        actions: [ShopAddButton(onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShopSearchBar(
                controller: searchController,
                keyboardType: TextInputType.name,
                hintText: "Search",
                prefixIcon: ImagePaths.serach,
                onChange: (value) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ShopCustomOutlinedButton(
                          label: "Filter",
                          icon: ImagePaths.filter,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterScreen()))),
                    ),
                    const SizedBox(width: 17),
                    Expanded(
                      child: ShopCustomOutlinedButton(
                        label: "Map",
                        icon: ImagePaths.map,
                        onPressed: () {},
                      ),
                    )
                  ]),
            ),
            if (flag == true)
              const Expanded(
                  flex: 8, child: Center(child: CircularProgressIndicator())),
            Expanded(child: _buildShopCardsList(allShopsList)),
          ],
        ),
      ),
    );
  }
}

Widget _buildShopCardsList(List<ShopsDataResponseModel> item) =>
    ListView.separated(
        itemCount: item.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return ShopCard(
            shopName: item[index].shopNameEn.toString(),
            visitedByName: item[index].shopLastVistedBy.toString(),
            visitedOnDate:
                dateFormat(item[index].shopLastVisitedDate.toString()),
            shopLocation: '${item[index].shopRegionEn.toString()}'
                ' - ${item[index].shopAreaEn.toString()}',
            shopStatus: item[index].shopStatusEn.toString(),
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
