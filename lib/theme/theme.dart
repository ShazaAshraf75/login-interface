import 'package:flutter/material.dart';
import 'package:login_interface/constants/constants.dart';

ThemeData defaultTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: ColorManager.lightGreyColor,
  errorBorder: OutlineInputBorder(
    
    
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: ColorManager.lightGreyColor)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: ColorManager.lightGreyColor)),
  border: InputBorder.none,
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red)),
  contentPadding: const EdgeInsets.all(12),
));
