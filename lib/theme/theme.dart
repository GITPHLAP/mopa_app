import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(255, 103, 0, 1);
  
  static Color secondaryColor = const Color.fromRGBO(18,18,18, 1);
  static Color secondaryAccent = const Color.fromRGBO(37,38,37, 1);

  static Color thirdColor = const Color.fromRGBO(62,66,62, 1);

  static Color titleColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color textColor = const Color.fromRGBO(200,200,200, 1);
  static Color sucessColor = Colors.green;
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
  ),

  scaffoldBackgroundColor: AppColors.secondaryColor,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryAccent,
    foregroundColor: AppColors.titleColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  )

  
);
