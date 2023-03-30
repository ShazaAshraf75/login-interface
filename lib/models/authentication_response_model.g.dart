// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponseModel _$AuthenticationResponseModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponseModel(
      resultCode: json['resultcode'] as int?,
      resultMessageEn: json['resultmessageen'] as String?,
      resultMessageAr: json['resultmessagear'] as String?,
      userDataResponseModel: json['data'] == null
          ? null
          : UserDataResponseModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationResponseModelToJson(
        AuthenticationResponseModel instance) =>
    <String, dynamic>{
      'resultcode': instance.resultCode,
      'resultmessageen': instance.resultMessageEn,
      'resultmessagear': instance.resultMessageAr,
      'data': instance.userDataResponseModel,
    };
