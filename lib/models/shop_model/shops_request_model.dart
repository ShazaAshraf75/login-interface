import 'package:json_annotation/json_annotation.dart';
import 'package:login_interface/models/shop_model/shops_data_request_model.dart';
part 'shops_request_model.g.dart';

@JsonSerializable()
class ShopsRequestModel {
  @JsonKey(name: 'userid')
  final int? userId;
  @JsonKey(name: 'ipaddress')
  final String? ipAddress;
  @JsonKey(name: 'devicetoken')
  final String? deviceToken;
  @JsonKey(name: 'osversion')
  final String? osversion;
  @JsonKey(name: 'AppVersion')
  final String? appVersion;
  @JsonKey(name: 'devicetype')
  final String? deviceType;
  @JsonKey(name: 'data')
  final ShopsDataRequestModel? shopsDataRequestModel;

  ShopsRequestModel({
    required this.userId,
    required this.ipAddress,
    required this.deviceToken,
    required this.osversion,
    required this.appVersion,
    required this.deviceType,
    required this.shopsDataRequestModel,
  });

  factory ShopsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsRequestModelToJson(this);
}
