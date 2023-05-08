import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/models/authentication_model/user_data_response_model.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_bloc.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/details/shop_details_screen.dart';
import 'package:login_interface/modules/survey/my_shops/filter/filter_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_add_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_outlined_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_search_bar.dart';
import 'package:login_interface/utils/date_format/date_format.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class MyShopsContent extends StatefulWidget {
  final TextEditingController searchController;
  List<ShopsDataResponseModel> allShopsList;
  List<ShopsDataResponseModel> foundShopsList;

  final bool flag;

  MyShopsContent(
      {super.key,
      required this.searchController,
      required this.allShopsList,
      required this.foundShopsList,
      required this.flag});

  @override
  State<MyShopsContent> createState() => _MyShopsContentState();
}

class _MyShopsContentState extends State<MyShopsContent> {
  // @override
  // void initState() {
  //   foundShops = widget.allShopsList;
  //   print("this is the lenngth of secon initiate state${foundShops.length}");
  //   super.initState();
  // }

  void _searchInShopsList(String key) {
    List<ShopsDataResponseModel> results = [];
    if (key.isEmpty) {
      results = widget.allShopsList;
    } else {
      results = widget.allShopsList
          .where((element) =>
              element.shopNameEn!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      widget.foundShopsList = results;
    });
  }

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
                controller: widget.searchController,
                keyboardType: TextInputType.name,
                hintText: "Search",
                prefixIcon: ImagePaths.serach,
                onChange: (value) {
                  value = widget.searchController.text;
                  _searchInShopsList(value);
                  // setState(() {});
                  // BlocProvider.of<ShopsBloc>(context).add(
                  //     SearchInAllShopsListEvent(
                  //         key: widget.searchController.text));
                  // print(widget.searchController.text);
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
            if (widget.flag == true)
              const Expanded(
                  flex: 8, child: Center(child: CircularProgressIndicator())),
            Expanded(child: _buildShopCardsList(widget.foundShopsList)),
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
