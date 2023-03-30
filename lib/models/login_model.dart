// ignore_for_file: unnecessary_question_mark

import 'package:json_annotation/json_annotation.dart';

class LoginModel {
  int? resultCode;
  String? resultMessageEn;
  String? resultMessageAr;
  LoginUserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultcode'];
    resultMessageEn = json['resultmessageen'];
    resultMessageAr = json['resultmessagear'];
    data = json['data'] != null ? LoginUserData.fromJson(json['data']) : null;
  }
}

class LoginUserData {
  int? userPkID;
  String? username;
  String? userPhoneNumber;
  bool? userMobileEnable;
  bool? userMobileActivationState;
  dynamic userMobileActivationCode;
  String? userDevice;
  String? userTypeEn;
  String? userTypeAr;
  String? userImage;
  bool? isTracking;
  bool? checkShopLocation;
  int? shopLocationDistance;
  int? timeToTrack;

  LoginUserData.fromJson(Map<String, dynamic> json) {
    userPkID = json['User_PK_ID'];
    username = json['User_Name'];
    userPhoneNumber = json['User_PhoneNumber'];
    userMobileEnable = json['User_MobileEnable'];
    userMobileActivationState = json['User_MobileActivationState'];
    userMobileActivationCode = json['User_MobileActivationCode'];
    userDevice = json['User_divice'];
    userTypeEn = json['UserTypeEn'];
    userTypeAr = json['UserTypeAr'];
    userImage = json['UserImage'];
    isTracking = json['IsTracking'];
    checkShopLocation = json['CheckShopLocation'];
    shopLocationDistance = json['ShopLocationDistance'];
    timeToTrack = json['TimeToTrack'];
  }
}
