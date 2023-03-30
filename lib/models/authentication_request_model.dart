import 'package:json_annotation/json_annotation.dart';

part 'authentication_request_model.g.dart';

@JsonSerializable()
class AuthenticationRequestModel {
  @JsonKey(name: 'userid')
  final int? userId;
  @JsonKey(name: 'ipaddress')
  final String? ipAddress;
  @JsonKey(name: 'devicetoken')
  final String? deviceToken;
  @JsonKey(name: 'osversion')
  final String? osversion;
  @JsonKey(name: 'AppVersion')
  final String? appVersion;
  @JsonKey(name: 'devicetype')
  final String? deviceType;
  @JsonKey(name: 'data')
  final UserDataRequestModel? userDataRequestModel;

  AuthenticationRequestModel({
    this.userId,
    this.ipAddress,
    this.deviceToken,
    this.osversion,
    this.appVersion,
    this.deviceType,
    this.userDataRequest,
  });

  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationRequestModelToJson(this);
}
