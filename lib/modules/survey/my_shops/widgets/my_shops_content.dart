// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_bloc.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/filter/filter_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_add_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_outlined_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_search_bar.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shops_list_view.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class MyShopsContent extends StatelessWidget {
  final TextEditingController searchController;
  List<ShopsDataResponseModel> allShopsList;
  final bool flag;

  MyShopsContent({
    Key? key,
    required this.searchController,
    required this.allShopsList,
    required this.flag,
  }) : super(key: key);

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
                onClearPressed: () {
                  searchController.clear();
                  BlocProvider.of<ShopsBloc>(context)
                      .add(SearchInAllShopsListEvent(key: ""));
                },
                onChange: (value) {
                  value = searchController.text;
                  BlocProvider.of<ShopsBloc>(context).add(
                      SearchInAllShopsListEvent(key: searchController.text));
                }),
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
                                  builder: (context) => FilterScreen()))),
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
            Expanded(child: ShopsListView(item: allShopsList, flag: flag)),
          ],
        ),
      ),
    );
  }
}
