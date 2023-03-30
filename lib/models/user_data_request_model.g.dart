// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataRequestModel _$UserDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserDataRequestModel(
      userName: json['User_Name'] as String?,
      password: json['User_Password'] as String?,
    );

Map<String, dynamic> _$UserDataRequestModelToJson(
        UserDataRequestModel instance) =>
    <String, dynamic>{
      'User_Name': instance.userName,
      'User_Password': instance.password,
    };
