import 'package:flutter/material.dart';
import 'package:login_interface/theme/color_manager.dart';

ThemeData defaultTheme = ThemeData(
    primaryColor: ColorManager.darkPurpleColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'MontserratB', color: Colors.black, fontSize: 18)),
    textTheme: const TextTheme(
        labelLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 13)),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.darkPurpleColor,
      selectionColor: Colors.deepPurple[100],
      selectionHandleColor: Colors.deepPurple[100],
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.lightGreyColor,
      errorStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 10),
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
