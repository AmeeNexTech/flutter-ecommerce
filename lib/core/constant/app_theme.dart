import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme(String? languageCode) {
  return ThemeData(
    fontFamily: languageCode == 'ar' ? 'Cairo' : 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: Colors.black87,
        letterSpacing: 0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColor.grey,
        fontWeight: FontWeight.w500,
        height: 1.6,
        letterSpacing: 0.3,
      ),
    ),
  );
}
