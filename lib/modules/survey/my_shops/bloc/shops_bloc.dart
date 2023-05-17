// ignore_for_file: unnecessary_cast, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_repository.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_states.dart';

class ShopsBloc extends Bloc<ShopsEvents, ShopsStates> {
  final ShopsRepository shopsRepository = ShopsRepository();
  List<ShopsDataResponseModel> allShopsList = [];
  List<ShopsDataResponseModel> filteredDates = [];
  DateFormat format = DateFormat('dd/MM/yyyy');

  ShopsBloc() : super(ShopsInitialState()) {
    on<ShopsFetechedEvent>(_onShopsFetchedEvent);
    on<SearchInAllShopsListEvent>(_onSearchInAllShopsListEvent);
    on<BeetweenDatesFilterEvent>(_onBetweenDatesFilterEvent);
    on<FromDateFilterEvent>(_onFromDateFilterEvent);
    on<ToDateFilterEvent>(_onToDateFilterEvent);
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

  void _onBetweenDatesFilterEvent(
      BeetweenDatesFilterEvent event, Emitter<ShopsStates> emit) {
    allShopsList = shopsRepository.shopsDataResponseList!;
    DateTime fromDate = format.parse(event.fromDate);
    DateTime toDate = format.parse(event.toDate);
    // List<DateTime?> dates =
    //     allShopsList.map((e) => format.parse(e.shopCreatedDate!)).toList();
    // print(dates[0]);
    print("BetweenDattes");
    filteredDates = allShopsList
        .where((element) =>
            (DateTime.parse(element.shopCreatedDate!).isBefore(toDate) ||
                DateTime.parse(element.shopCreatedDate!)
                    .isAtSameMomentAs(toDate)) &&
            (DateTime.parse(element.shopCreatedDate!).isAfter(fromDate) ||
                DateTime.parse(element.shopCreatedDate!)
                    .isAtSameMomentAs(fromDate)))
        .toList();
    print(filteredDates.length);
    emit(FilterInShopsState(shopsDataResponseList: filteredDates));
  }

  void _onFromDateFilterEvent(
      FromDateFilterEvent event, Emitter<ShopsStates> emit) {
    allShopsList = shopsRepository.shopsDataResponseList!;
    print("fromdate");

    DateTime fromDate = format.parse(event.fromDate);
    filteredDates = allShopsList
        .where((element) =>
            DateTime.parse(element.shopCreatedDate!).isAfter(fromDate) ||
            DateTime.parse(element.shopCreatedDate!).isAtSameMomentAs(fromDate))
        .toList();
    print(filteredDates.length);
    emit(FilterInShopsState(shopsDataResponseList: filteredDates));
  }

  void _onToDateFilterEvent(
      ToDateFilterEvent event, Emitter<ShopsStates> emit) {
    allShopsList = shopsRepository.shopsDataResponseList!;
    DateTime toDate = format.parse(event.toDate);
    print("ToDmdate");

    filteredDates = allShopsList
        .where((element) =>
            DateTime.parse(element.shopCreatedDate!).isBefore(toDate) ||
            DateTime.parse(element.shopCreatedDate!).isAtSameMomentAs(toDate))
        .toList();
    print(filteredDates.length);
    emit(FilterInShopsState(shopsDataResponseList: filteredDates));
  }
}
