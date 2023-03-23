import 'package:flutter/material.dart';

class AppFonts {
  static const montserrat = "Helvetica";

  static const textsColor = Color(0xff292D32);

  static final textTheme = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 67.0,
      fontWeight: MyFontWeight.bold,
      // color: textsColor,
    ).withZoomFix,
    // displayMedium: const TextStyle(
    //   fontSize: 22.0,
    //   fontWeight: DineFontWeight.bold,
    // //   color: textsColor,
    // ).withZoomFix,
    // displaySmall: const TextStyle(
    //   fontSize: 22.0,
    //   fontWeight: DineFontWeight.semiBold,
    // //   color: textsColor,
    // ).withZoomFix,
    // headlineMedium: const TextStyle(
    //   fontSize: 20.0,
    //   fontWeight: DineFontWeight.bold,
    // //   color: textsColor,
    // ).withZoomFix,
    // headlineSmall: const TextStyle(
    //   fontSize: 20,
    //   fontWeight: DineFontWeight.semiBold,
    // //   color: textsColor,
    // ).withZoomFix,
    // titleLarge: const TextStyle(
    //   fontSize: 18,
    //   fontWeight: DineFontWeight.semiBold,
    // //   color: textsColor,
    // ).withZoomFix,
    // titleMedium: const TextStyle(
    //   fontSize: 20,
    //   fontWeight: DineFontWeight.medium,
    // //   color: textsColor,
    // ).withZoomFix,
    // titleSmall: const TextStyle(
    //   fontSize: 16,
    //   fontWeight: DineFontWeight.regular,
    // //   color: textsColor,
    // ).withZoomFix,
    bodyLarge: const TextStyle(
      fontSize: 36,
      fontWeight: MyFontWeight.regular,
      // color: textsColor,
    ).withZoomFix,
    bodyMedium: const TextStyle(
      fontSize: 24,
      fontWeight: MyFontWeight.regular,
      // color: textsColor,
    ).withZoomFix,
    // labelLarge: const TextStyle(
    //   fontSize: 14,
    //   fontWeight: DineFontWeight.semiBold,
    // //   color: textsColor,
    // ).withZoomFix,
    bodySmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: MyFontWeight.regular,
      // color: textsColor,
    ).withZoomFix,
    labelSmall: const TextStyle(
      fontSize: 08.0,
      fontWeight: MyFontWeight.medium,
      letterSpacing: 0.0,
      // color: textsColor,
    ).withZoomFix,
  );
}

abstract class MyFontWeight {
  static const regular = FontWeight.w400;
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w700;
}

extension on TextStyle {
  /// https://github.com/flutter/flutter/issues/65526
  TextStyle get withZoomFix => copyWith(wordSpacing: 0);
}
