import 'package:login_interface/models/shop_model/shops_data_response_model.dart';

abstract class ShopsStates {}

class ShopsInitialState extends ShopsStates {}

class ShopsLoadingState extends ShopsStates {}

class ShopsApiSuccessState extends ShopsStates {
  final List<ShopsDataResponseModel> shopsDataResponseList;

  ShopsApiSuccessState({required this.shopsDataResponseList});
}

class ShopsApiFailState extends ShopsStates {
  final String apiFailMessage;

  ShopsApiFailState({required this.apiFailMessage});
}

class ShopsNetworkFailState extends ShopsStates {
  final String errorMessage;

  ShopsNetworkFailState({required this.errorMessage});
}

class SearchInAllShopsListState extends ShopsStates {
  final List<ShopsDataResponseModel> shopsDataResponseList;

  SearchInAllShopsListState({required this.shopsDataResponseList});
}
class FilterInShopsState extends ShopsStates {
  final List<ShopsDataResponseModel> shopsDataResponseList;

  FilterInShopsState({required this.shopsDataResponseList});
}





