import 'package:flutter/material.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';
import '../app_texts/app_fonts.dart';

ThemeData getDarkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: DarkAppColors.grey900,
    brightness: Brightness.dark,
    fontFamily: AppFonts.cairo,
    primaryColor: DarkAppColors.primary800,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DarkAppColors.primary800,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: DarkAppColors.grey0,
      displayColor: DarkAppColors.grey0,
      fontFamily: AppFonts.cairo,
    ),
  );
}
