// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseModel _$UserDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserDataResponseModel(
      userPkId: json['User_PK_ID'] as int?,
      userName: json['User_Name'] as String?,
      userPhoneNumber: json['User_PhoneNumber'] as String?,
      userMobileEnable: json['User_MobileEnable'] as bool?,
      userMobileActivationState: json['User_MobileActivationState'] as bool?,
      userMobileActivationCode: json['User_MobileActivationCode'],
      userDevice: json['User_divice'] as String?,
      userTypeEn: json['UserTypeEn'] as String?,
      userTypeAr: json['UserTypeAr'] as String?,
      userImage: json['UserImage'] as String?,
      isTracking: json['IsTracking'] as bool?,
      checkShopLocation: json['CheckShopLocation'] as bool?,
      shopLocationDistance: json['ShopLocationDistance'] as int?,
      timeToTrack: json['TimeToTrack'] as int?,
    );

Map<String, dynamic> _$UserDataResponseModelToJson(
        UserDataResponseModel instance) =>
    <String, dynamic>{
      'User_PK_ID': instance.userPkId,
      'User_Name': instance.userName,
      'User_PhoneNumber': instance.userPhoneNumber,
      'User_MobileEnable': instance.userMobileEnable,
      'User_MobileActivationState': instance.userMobileActivationState,
      'User_MobileActivationCode': instance.userMobileActivationCode,
      'User_divice': instance.userDevice,
      'UserTypeEn': instance.userTypeEn,
      'UserTypeAr': instance.userTypeAr,
      'UserImage': instance.userImage,
      'IsTracking': instance.isTracking,
      'CheckShopLocation': instance.checkShopLocation,
      'ShopLocationDistance': instance.shopLocationDistance,
      'TimeToTrack': instance.timeToTrack,
    };
