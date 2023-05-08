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
      SearchInAllShopsListEvent event, Emitter<ShopsStates> emit) {
        
    allShopsList = [];
    if (event.key.isNotEmpty) {
      for (ShopsDataResponseModel element in allShopsList) {
        if (element.shopNameEn!.toLowerCase().contains(event.key)) {
          allShopsList.add(element);
        }
      }
      emit(SearchInAllShopsListState(shopsDataResponseList: allShopsList));
    } else {
      emit(SearchInAllShopsListState(shopsDataResponseList: allShopsList));
    }
  }
}
