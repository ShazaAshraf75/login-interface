// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsRequestModel _$ShopsRequestModelFromJson(Map<String, dynamic> json) =>
    ShopsRequestModel(
      userId: json['userid'] as int?,
      ipAddress: json['ipaddress'] as String?,
      deviceToken: json['devicetoken'] as String?,
      osversion: json['osversion'] as String?,
      appVersion: json['AppVersion'] as String?,
      deviceType: json['devicetype'] as String?,
      shopsDataRequestModel: json['data'] == null
          ? null
          : ShopsDataRequestModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopsRequestModelToJson(ShopsRequestModel instance) =>
    <String, dynamic>{
      'userid': instance.userId,
      'ipaddress': instance.ipAddress,
      'devicetoken': instance.deviceToken,
      'osversion': instance.osversion,
      'AppVersion': instance.appVersion,
      'devicetype': instance.deviceType,
      'data': instance.shopsDataRequestModel,
    };
