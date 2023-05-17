import 'package:json_annotation/json_annotation.dart';

part 'shops_data_response_model.g.dart';

@JsonSerializable()
class ShopsDataResponseModel {
  @JsonKey(name: "RowNumber")
  int? rowNumber;
  @JsonKey(name: "Shop_PK_ID")
  int? shopPkId;
  @JsonKey(name: "Shop_Name_En")
  String? shopNameEn;
  @JsonKey(name: "Shop_Name_Ar")
  String? shopNameAr;
  @JsonKey(name: "Shop_Code")
  String? shopCode;
  @JsonKey(name: "Shop_RegionEn")
  String? shopRegionEn;
  @JsonKey(name: "Shop_RegionAr")
  String? shopRegionAr;
  @JsonKey(name: "Shop_RegionID")
  int? shopRegionID;
  @JsonKey(name: "Shop_AreaEn")
  String? shopAreaEn;
  @JsonKey(name: "Shop_AreaAr")
  String? shopAreaAr;
  @JsonKey(name: "Shop_AreaID")
  int? shopAreaID;
  @JsonKey(name: "Shop_PartnerEn")
  String? shopPartnerEn;
  @JsonKey(name: "Shop_PartnerAr")
  String? shopPartnerAr;
  @JsonKey(name: "Shop_Partner_FK_ID")
  String? shopPartnerFkId;
  @JsonKey(name: "Shop_StatusAr")
  String? shopStatusAr;
  @JsonKey(name: "Shop_StatusEn")
  String? shopStatusEn;
  @JsonKey(name: "Shop_ShopStatus_FK_ID")
  int? shopShopStatusFkId;
  @JsonKey(name: "Shop_Image")
  String? shopImage;
  @JsonKey(name: "Shop_Phone")
  String? shopPhone;
  @JsonKey(name: "Shop_Owner")
  String? shopOwner;
  @JsonKey(name: "Shop_Email")
  String? shopEmail;
  @JsonKey(name: "Shop_Company")
  String? shopCompany;
  @JsonKey(name: "Shop_Address")
  String? shopAddress;
  @JsonKey(name: "Shop_ChannelType_FK_ID")
  String? shopChannelTypeFkId;
  @JsonKey(name: "Shop_Remark")
  String? shopRemark;
  @JsonKey(name: "Shop_LastVisiteddate")
  String? shopLastVisitedDate;
  @JsonKey(name: "Shop_LastVistedby")
  String? shopLastVistedBy;
  @JsonKey(name: "Shop_PendingUpdate")
  bool? shopPendingUpdate;
  @JsonKey(name: "Shop_CreatedDate")
  String? shopCreatedDate;

  ShopsDataResponseModel({
    this.rowNumber,
    this.shopAddress,
    this.shopAreaAr,
    this.shopAreaEn,
    this.shopAreaID,
    this.shopChannelTypeFkId,
    this.shopCode,
    this.shopCompany,
    this.shopEmail,
    this.shopImage,
    this.shopLastVisitedDate,
    this.shopLastVistedBy,
    this.shopNameAr,
    this.shopNameEn,
    this.shopOwner,
    this.shopPartnerAr,
    this.shopPartnerEn,
    this.shopPartnerFkId,
    this.shopPendingUpdate,
    this.shopPhone,
    this.shopPkId,
    this.shopRegionAr,
    this.shopRegionEn,
    this.shopRegionID,
    this.shopRemark,
    this.shopShopStatusFkId,
    this.shopStatusAr,
    this.shopStatusEn,
    this.shopCreatedDate,
  });

  factory ShopsDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsDataResponseModelToJson(this);
}
