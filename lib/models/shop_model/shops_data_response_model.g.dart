// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsDataResponseModel _$ShopsDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShopsDataResponseModel(
      rowNumber: json['RowNumber'] as int?,
      shopAddress: json['Shop_Address'] as String?,
      shopAreaAr: json['Shop_AreaAr'] as String?,
      shopAreaEn: json['Shop_AreaEn'] as String?,
      shopAreaID: json['Shop_AreaID'] as int?,
      shopChannelTypeFkId: json['Shop_ChannelType_FK_ID'] as String?,
      shopCode: json['Shop_Code'] as String?,
      shopCompany: json['Shop_Company'] as String?,
      shopEmail: json['Shop_Email'] as String?,
      shopImage: json['Shop_Image'] as String?,
      shopLastVisitedDate: json['Shop_LastVisiteddate'] as String?,
      shopLastVistedBy: json['Shop_LastVistedby'] as String?,
      shopNameAr: json['Shop_Name_Ar'] as String?,
      shopNameEn: json['Shop_Name_En'] as String?,
      shopOwner: json['Shop_Owner'] as String?,
      shopPartnerAr: json['Shop_PartnerAr'] as String?,
      shopPartnerEn: json['Shop_PartnerEn'] as String?,
      shopPartnerFkId: json['Shop_Partner_FK_ID'] as String?,
      shopPendingUpdate: json['Shop_PendingUpdate'] as bool?,
      shopPhone: json['Shop_Phone'] as String?,
      shopPkId: json['Shop_PK_ID'] as int?,
      shopRegionAr: json['Shop_RegionAr'] as String?,
      shopRegionEn: json['Shop_RegionEn'] as String?,
      shopRegionID: json['Shop_RegionID'] as int?,
      shopRemark: json['Shop_Remark'] as String?,
      shopShopStatusFkId: json['Shop_ShopStatus_FK_ID'] as int?,
      shopStatusAr: json['Shop_StatusAr'] as String?,
      shopStatusEn: json['Shop_StatusEn'] as String?,
      shopCreatedDate: json['Shop_CreatedDate'] as String?,
    );

Map<String, dynamic> _$ShopsDataResponseModelToJson(
        ShopsDataResponseModel instance) =>
    <String, dynamic>{
      'RowNumber': instance.rowNumber,
      'Shop_PK_ID': instance.shopPkId,
      'Shop_Name_En': instance.shopNameEn,
      'Shop_Name_Ar': instance.shopNameAr,
      'Shop_Code': instance.shopCode,
      'Shop_RegionEn': instance.shopRegionEn,
      'Shop_RegionAr': instance.shopRegionAr,
      'Shop_RegionID': instance.shopRegionID,
      'Shop_AreaEn': instance.shopAreaEn,
      'Shop_AreaAr': instance.shopAreaAr,
      'Shop_AreaID': instance.shopAreaID,
      'Shop_PartnerEn': instance.shopPartnerEn,
      'Shop_PartnerAr': instance.shopPartnerAr,
      'Shop_Partner_FK_ID': instance.shopPartnerFkId,
      'Shop_StatusAr': instance.shopStatusAr,
      'Shop_StatusEn': instance.shopStatusEn,
      'Shop_ShopStatus_FK_ID': instance.shopShopStatusFkId,
      'Shop_Image': instance.shopImage,
      'Shop_Phone': instance.shopPhone,
      'Shop_Owner': instance.shopOwner,
      'Shop_Email': instance.shopEmail,
      'Shop_Company': instance.shopCompany,
      'Shop_Address': instance.shopAddress,
      'Shop_ChannelType_FK_ID': instance.shopChannelTypeFkId,
      'Shop_Remark': instance.shopRemark,
      'Shop_LastVisiteddate': instance.shopLastVisitedDate,
      'Shop_LastVistedby': instance.shopLastVistedBy,
      'Shop_PendingUpdate': instance.shopPendingUpdate,
      'Shop_CreatedDate': instance.shopCreatedDate,
    };
