// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_manager.dart';
import 'package:login_interface/data/data_source/remote/shop_api/shops_api_manager.dart';
import 'package:login_interface/models/shop_model/shops_data_request_model.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_repository.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_states.dart';
import 'package:login_interface/modules/survey/my_shops/details/shop_details_screen.dart';
import 'package:login_interface/modules/survey/my_shops/filter/filter_screen.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/my_shops_content.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_add_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_card.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_outlined_button.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_search_bar.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

import 'bloc/shops_bloc.dart';

class MyShopsScreen extends StatefulWidget {
  const MyShopsScreen({super.key});

  @override
  State<MyShopsScreen> createState() => _MyShopsScreenState();
}

class _MyShopsScreenState extends State<MyShopsScreen> {
  TextEditingController searchController = TextEditingController();
  List<ShopsDataResponseModel> allShopsList = [];
  List<ShopsDataResponseModel> foundShopsList = [];

  bool flag = false;

  @override
  void initState() {
    BlocProvider.of<ShopsBloc>(context).add(ShopsFetechedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopsBloc, ShopsStates>(
      listener: (context, state) {
        if (state is ShopsLoadingState) {
          flag = true;
        } else if (state is ShopsApiSuccessState) {
          flag = false;
          allShopsList = state.shopsDataResponseList;
        }
        // else if (state is SearchInAllShopsListState) {
        //   foundShopsList = allShopsList;
        //   allShopsList = state.shopsDataResponseList;
        //   print("object");
        //   print(allShopsList.length);
        // }
      },
      builder: (context, state) {
        foundShopsList = allShopsList;
        return MyShopsContent(
          allShopsList: allShopsList,
          searchController: searchController,
          flag: flag,
          foundShopsList: foundShopsList,
        );
      },
    );
  }
}
