import 'package:json_annotation/json_annotation.dart';

part 'shop_service_model.g.dart';

@JsonSerializable()
class ShopServiceModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "nameen")
  final String nameEnglish;
  @JsonKey(name: "namear")
  final String nameArabic;
  @JsonKey(name: "code")
  final String? code;
  bool isSelected;

  ShopServiceModel(
      {this.id = 0,
      this.code = "",
      this.nameArabic = "",
      this.nameEnglish = "",
      this.isSelected = false});

  factory ShopServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ShopServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopServiceModelToJson(this);
}
