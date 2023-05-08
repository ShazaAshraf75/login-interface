// ignore_for_file: unnecessary_cast

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_repository.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_states.dart';

class ShopsBloc extends Bloc<ShopsEvents, ShopsStates> {
  final ShopsRepository shopsRepository = ShopsRepository();
  List<ShopsDataResponseModel> allShopsList = [];

  ShopsBloc() : super(ShopsInitialState()) {
    on<ShopsFetechedEvent>(_onShopsFetchedEvent);
    on<SearchInAllShopsListEvent>(_onSearchInAllShopsListEvent);
  }

  Future<void> _onShopsFetchedEvent(
      ShopsFetechedEvent event, Emitter<ShopsStates> emit) async {
    emit(ShopsLoadingState());
    await shopsRepository.getAllShopsList().then((value) {
      emit(value);
    });
  }

  void _onSearchInAllShopsListEvent(
      SearchInAllShopsListEvent event, Emitter<ShopsStates> emit) async {
    allShopsList = shopsRepository.shopsDataResponseList!;
    List<ShopsDataResponseModel> results = [];
    if (event.key.isEmpty) {
      results = allShopsList;
      emit(SearchInAllShopsListState(shopsDataResponseList: results));
    } else {
      results = allShopsList
          .where((element) => element.shopNameEn!
              .toLowerCase()
              .contains(event.key.toLowerCase()))
          .toList();
      emit(SearchInAllShopsListState(shopsDataResponseList: results));
    }
  }
}
