import 'package:json_annotation/json_annotation.dart';
import 'package:login_interface/models/authentication_model/user_data_request_model.dart';
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
    required this.userId,
    required this.ipAddress,
    required this.deviceToken,
    required this.osversion,
    required this.appVersion,
    required this.deviceType,
    required this.userDataRequestModel,
  });

  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationRequestModelToJson(this);
}
