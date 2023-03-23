import 'package:flutter/material.dart';

import 'fonts.dart';

abstract class AppThemes {
  // static const primaryColor = Color(0xffef4164);
  // static const primaryColorLight = Color(0xffE5B7C2);
  // static const accentColor = Color(0xffFEECF0);
  // static const backgroundColor = Color(0xfff5f5f5);
  // static const onBackgroundColor = Color(0xff626262);
  // static const scaffoldBackgroundColor = Colors.white;
  // static const errorColor = Color(0xffbf1010);
  // static const shadowColor = Color(0x3f000000);
  // static const unselectedWidgetColor = Color(0xffb2b2b2);
  // static const secondaryTextColor = Colors.black54;
  // static const disabledColor = Color(0xffb3b3b3);
  // static const disabledBackgroundColor = Color(0x0c000000);
  // static const barrierColor = Color(0xff757575);
  // static const barrierColorDark = Color(0xff6e6e6e);
  // static const secondaryHeaderColor = Color(0xff24974B);
  // static const inverseSurface = Color(0xffE9FAEF);

  static ThemeData _baseTheme({
    Brightness brightness = Brightness.light,
    required Color backgroundColor,
    required Color primaryColor,
    required Color secondaryColor,
  }) =>
      ThemeData(
        textTheme: AppFonts.textTheme,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: brightness,
          primary: primaryColor,
          secondary: secondaryColor,
          onBackground: primaryColor,
          background: backgroundColor,
        ),
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.android:
        //         CupertinoPageTransitionsBuilderWithoutBackGesture(),
        //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //   },
        // ),
        primaryColor: primaryColor,
        splashColor: Colors.black12,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: AppFonts.montserrat,
      );

  /// light theme
  static ThemeData light = _baseTheme(
    brightness: Brightness.light,
    primaryColor: const Color(0xff1C1C1C),
    backgroundColor: const Color(0xffF5F5F5),
    secondaryColor: const Color(0xff1C1C1C),
  );

  /// dark theme
  static ThemeData dark = _baseTheme(
    brightness: Brightness.dark,
    primaryColor: const Color(0xffF6F6F7),
    backgroundColor: const Color(0xff120E16),
    secondaryColor: const Color(0xff613FE5),
  );
}
