// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsResponseModel _$ShopsResponseModelFromJson(Map<String, dynamic> json) =>
    ShopsResponseModel(
      resultCode: json['resultcode'] as int?,
      resultMessageEn: json['resultmessageen'] as String?,
      resultMessageAr: json['resultmessagear'] as String?,
      shopsDataResponseModel: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => ShopsDataResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopsResponseModelToJson(ShopsResponseModel instance) =>
    <String, dynamic>{
      'resultcode': instance.resultCode,
      'resultmessageen': instance.resultMessageEn,
      'resultmessagear': instance.resultMessageAr,
      'data': instance.shopsDataResponseModel,
    };
