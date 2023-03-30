// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequestModel _$AuthenticationRequestModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRequestModel(
      userId: json['userid'] as int?,
      ipAddress: json['ipaddress'] as String?,
      deviceToken: json['devicetoken'] as String?,
      osversion: json['osversion'] as String?,
      appVersion: json['AppVersion'] as String?,
      deviceType: json['devicetype'] as String?,
      userDataRequestModel: json['data'] == null
          ? null
          : UserDataRequestModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationRequestModelToJson(
        AuthenticationRequestModel instance) =>
    <String, dynamic>{
      'userid': instance.userId,
      'ipaddress': instance.ipAddress,
      'devicetoken': instance.deviceToken,
      'osversion': instance.osversion,
      'AppVersion': instance.appVersion,
      'devicetype': instance.deviceType,
      'data': instance.userDataRequestModel,
    };
