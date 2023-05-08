import 'package:login_interface/data/data_source/remote/shop_api/shops_api_manager.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_states.dart';

class ShopsRepository {
  final ShopsApiManager shopsApiManager = ShopsApiManager();
  ShopsStates? shopsStates;
  List<ShopsDataResponseModel>? shopsDataResponseList;

  Future<ShopsStates> getAllShopsList() async {
    await shopsApiManager.getAllShopsList((response) {
      shopsDataResponseList = response;
      shopsStates = ShopsApiSuccessState(shopsDataResponseList: response);
    }, (response) {
      shopsStates = ShopsApiFailState(
          apiFailMessage: response.resultMessageEn.toString());
    }, (error) {
      shopsStates = ShopsNetworkFailState(errorMessage: error);
    });

    return shopsStates!;
  }
}
