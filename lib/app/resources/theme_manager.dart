
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/styles_manager.dart';
import 'package:hospital_managment_system/app/resources/values_manager.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}
int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));
Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);
int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app


      colorScheme: ColorScheme.light().copyWith(
        background: Colors.white, // Set the desired background color
      ),
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.grey.withOpacity(0.2),
      // will be used incase of disabled button for example
      hintColor: ColorManager.grey,
      
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                color: ColorManager.white,
                fontWeight: FontWeight.w500
              ), backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12))),

      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
          color: ColorManager.black,
          fontWeight: FontWeight.w600

          ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          // Other style properties...
          ),
        displaySmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          // Other style properties...
          ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
          // Other style properties...
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',

        // Other style properties...
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        // Other style properties...
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        bodyLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        labelLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        labelMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        // Other style properties...
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
        // Other style properties...
        ),),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),

      ),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: -1,//here adjust based on your need
    ),
  );
}
