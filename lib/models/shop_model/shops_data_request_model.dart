import 'package:json_annotation/json_annotation.dart';

part 'shops_data_request_model.g.dart';

@JsonSerializable()
class ShopsDataRequestModel {
  @JsonKey(name: "KeyWord")
  String keyword;
  @JsonKey(name: "Shop_PK_ID")
  int shopId;
 

  ShopsDataRequestModel(
      {required this.keyword, required this.shopId});

  factory ShopsDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsDataRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsDataRequestModelToJson(this);
}
