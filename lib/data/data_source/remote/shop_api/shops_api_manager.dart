import 'package:login_interface/data/data_source/local/shared_prefrences/cache_helper.dart';
import 'package:login_interface/data/data_source/remote/shop_api/shops_api_service.dart';
import 'package:login_interface/models/shop_model/shops_data_request_model.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
import 'package:login_interface/models/shop_model/shops_request_model.dart';
import 'package:login_interface/models/shop_model/shops_response_model.dart';
import 'package:login_interface/utils/network/dio_helper.dart';

class ShopsApiManager {
  Future<void> getAllShopsList(
    Function(List<ShopsDataResponseModel>)? success,
    Function(ShopsResponseModel)? fail,
    Function(String)? apiNetworkFail,
  ) async {
    ShopsApiService shopsApiService = ShopsApiService(DioHelper.dio!);
    await shopsApiService
        .getAllShops(ShopsRequestModel(
            userId: CacheHelper.getData(key: "User_PK_ID"),
            ipAddress: "FUH0216913004222",
            deviceToken: "testtoken",
            osversion: "15.0",
            appVersion: "2",
            deviceType: "iOS",
            shopsDataRequestModel:
                ShopsDataRequestModel(keyword: '', shopId: -1)))
        .then((value) {
      if (value.resultCode == 1) {
        success!(value.shopsDataResponseModel as List<ShopsDataResponseModel>);
      } else {
        fail!(value);
      }
    }).catchError((onError) {
      apiNetworkFail!(onError.toString());
    });
  }
}
