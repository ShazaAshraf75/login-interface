import 'package:dio/dio.dart';
import 'package:login_interface/data/data_source/remote/api_key.dart';
import 'package:login_interface/models/shop_model/shops_request_model.dart';
import 'package:login_interface/models/shop_model/shops_response_model.dart';
import 'package:retrofit/http.dart';

part 'shops_api_service.g.dart';

@RestApi()
abstract class ShopsApiService {
  factory ShopsApiService(Dio dio) = _ShopsApiService;

  @POST(ApiKey.allShops)
  Future<ShopsResponseModel> getAllShops(@Body() ShopsRequestModel request);
}
