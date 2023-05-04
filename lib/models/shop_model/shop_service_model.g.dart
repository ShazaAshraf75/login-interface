// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopServiceModel _$ShopServiceModelFromJson(Map<String, dynamic> json) =>
    ShopServiceModel(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      nameArabic: json['namear'] as String? ?? "",
      nameEnglish: json['nameen'] as String? ?? "",
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$ShopServiceModelToJson(ShopServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameen': instance.nameEnglish,
      'namear': instance.nameArabic,
      'code': instance.code,
      'isSelected': instance.isSelected,
    };
