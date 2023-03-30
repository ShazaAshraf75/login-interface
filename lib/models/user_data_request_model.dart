import 'package:json_annotation/json_annotation.dart';

part 'user_data_request_model.g.dart';

@JsonSerializable()
class UserDataRequestModel {
  @JsonKey(name: 'User_Name')
  final String? userName;
  @JsonKey(name: 'User_Password')
  final String? password;

  UserDataRequestModel({
    this.userName,
    this.password,
  });

  factory UserDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataRequestModelToJson(this);
}
