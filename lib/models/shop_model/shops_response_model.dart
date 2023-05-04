import 'package:json_annotation/json_annotation.dart';
import 'package:login_interface/models/shop_model/shops_data_response_model.dart';
part 'shops_response_model.g.dart';

@JsonSerializable()
class ShopsResponseModel {
  @JsonKey(name: 'resultcode')
  int? resultCode;
  @JsonKey(name: 'resultmessageen')
  String? resultMessageEn;
  @JsonKey(name: 'resultmessagear')
  String? resultMessageAr;
  @JsonKey(name: 'data')
  List<ShopsDataResponseModel>? shopsDataResponseModel;

  ShopsResponseModel({
    this.resultCode,
    this.resultMessageEn,
    this.resultMessageAr,
    this.shopsDataResponseModel,
  });

  factory ShopsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsResponseModelToJson(this);
}
