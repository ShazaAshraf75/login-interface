import 'package:flutter/material.dart';
import 'package:login_interface/modules/survey/my_shops/details/shop_details_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_add_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_outlined_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_search_bar.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class MyShopsScreen extends StatelessWidget {
  const MyShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
                          onPressed: () {}),
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
            ShopCard(
              shopName: "shopName",
              visitedByName: "visitedByName",
              visitedOnDate: "visitedOnDate",
              shopLocation: "shopLocation",
              shopStatus: "Open",
              onCardPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShopDetailsScreen())),
              onUpdatePressed: () {},
              onLocationPressed: () {},
              onSurveyPressed: () {},
              onCallPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
