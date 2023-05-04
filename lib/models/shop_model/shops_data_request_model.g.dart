// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_data_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsDataRequestModel _$ShopsDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    ShopsDataRequestModel(
      keyword: json['KeyWord'] as String,
      shopId: json['Shop_PK_ID'] as int,
    );

Map<String, dynamic> _$ShopsDataRequestModelToJson(
        ShopsDataRequestModel instance) =>
    <String, dynamic>{
      'KeyWord': instance.keyword,
      'Shop_PK_ID': instance.shopId,
    };
