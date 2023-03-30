import 'package:json_annotation/json_annotation.dart';
import 'package:login_interface/models/user_data_response_model.dart';

part 'authentication_response_model.g.dart';

@JsonSerializable()
class AuthenticationResponseModel {
  @JsonKey(name: 'resultcode')
  final int? resultCode;
  @JsonKey(name: 'resultmessageen')
  final String? resultMessageEn;
  @JsonKey(name: 'resultmessagear')
  final String? resultMessageAr;
  @JsonKey(name: 'data')
  final UserDataResponseModel? userDataResponseModel;

  AuthenticationResponseModel({
    this.resultCode,
    this.resultMessageEn,
    this.resultMessageAr,
    this.userDataResponseModel,
  });

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseModelToJson(this);
}
