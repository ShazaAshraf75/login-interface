
import 'package:json_annotation/json_annotation.dart';

part 'user_data_response_model.g.dart';

@JsonSerializable()
class UserDataResponseModel {
  @JsonKey(name: 'User_PK_ID')
  final int? userPkId;
  @JsonKey(name: 'User_Name')
  final String? userName;
  @JsonKey(name: 'User_PhoneNumber')
  final String? userPhoneNumber;
  @JsonKey(name: 'User_MobileEnable')
  final bool? userMobileEnable;
  @JsonKey(name: 'User_MobileActivationState')
  final bool? userMobileActivationState;
  @JsonKey(name: 'User_MobileActivationCode')
  final dynamic? userMobileActivationCode;
  @JsonKey(name: 'User_divice')
  final String? userDevice;
  @JsonKey(name: 'UserTypeEn')
  final String? userTypeEn;
  @JsonKey(name: 'UserTypeAr')
  final String? userTypeAr;
  @JsonKey(name: 'UserImage')
  final String? userImage;
  @JsonKey(name: 'IsTracking')
  final bool? isTracking;
  @JsonKey(name: 'CheckShopLocation')
  final bool? checkShopLocation;
  @JsonKey(name: 'ShopLocationDistance')
  final int? shopLocationDistance;
  @JsonKey(name: 'TimeToTrack')
  final int? timeToTrack;

  UserDataResponseModel({
    this.userPkId,
    this.userName,
    this.userPhoneNumber,
    this.userMobileEnable,
    this.userMobileActivationState,
    this.userMobileActivationCode,
    this.userDevice,
    this.userTypeEn,
    this.userTypeAr,
    this.userImage,
    this.isTracking,
    this.checkShopLocation,
    this.shopLocationDistance,
    this.timeToTrack,
  });

    factory UserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseModelToJson(this);
}