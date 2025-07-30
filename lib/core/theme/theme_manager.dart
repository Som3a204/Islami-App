import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/color_pallette.dart';

abstract class ThemeManager {
  static ThemeData theme = ThemeData(
    primaryColor: ColorPallette.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF202020),
      titleTextStyle: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna",
          color: ColorPallette.primaryColor
      ),
      iconTheme: IconThemeData(
        color: ColorPallette.primaryColor
      )
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize:24,
        fontWeight: FontWeight.w700,
        fontFamily: "Janna",
        color: Color(0xFF000000)
    ),
      titleLarge: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna",
          color: Color(0xFFFFFFFF)
      ),
      bodyLarge: TextStyle(
          fontSize:16,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna",
          color: Color(0xFFFEFFE8)
      ),
      bodyMedium: TextStyle(
          fontSize:14,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna",
          color: Color(0xFFFFFFFF)
      ),
      bodySmall: TextStyle(
          fontSize:12,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna",
          color: Color(0xFFFFFFFF)
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPallette.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontSize:12,
          fontWeight: FontWeight.w700,
          fontFamily: "Janna"),
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
    )
  );
}