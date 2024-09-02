import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_guide/data/color_manager.dart';

class ThemeDataDef {
  static ThemeData themeDarkData = ThemeData.dark().copyWith(
    primaryColor: ColorManager.primary,
    textTheme: GoogleFonts.tajawalTextTheme(),
    scaffoldBackgroundColor: ColorManager.scaffoldBGDard,
    iconTheme: const IconThemeData(color: ColorManager.primary),
  );
  static ThemeData themelightData = ThemeData.light().copyWith(
    primaryColor: ColorManager.primary,
    textTheme: GoogleFonts.tajawalTextTheme(),
    appBarTheme: AppBarTheme(
      toolbarTextStyle: GoogleFonts.tajawal(),
      foregroundColor: ColorManager.white,
      backgroundColor: ColorManager.primary,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.tajawal().fontFamily,
        color: ColorManager.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: const IconThemeData(color: ColorManager.primary),
  );
}
