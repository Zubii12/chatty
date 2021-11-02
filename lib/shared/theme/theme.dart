import 'package:flutter/material.dart';

class Palette {
  const Palette._();

  // brand
  static const Color darkBlue = Color(0xFF001A83);
  static const Color defaultBlue = Color(0xFF302DE3);
  static const Color darkModeBlue = Color(0xFF375FFF);
  static const Color lightBlue = Color(0xFF879FFF);
  static const Color backgroundPurple = Color(0xF9D2D5F9);

  // neutral
  static const Color activeBlack = Color(0xFF0F1828);
  static const Color darkBlack = Color(0xFF152033);
  static const Color bodyBlack = Color(0xFF1B2B48);
  static const Color weakGrey = Color(0xFFA4A4A4);
  static const Color disabledGrey = Color(0xFFADB5BD);
  static const Color lineWhite = Color(0xFFEDEDED);
  static const Color offWhite = Color(0xFFF7F7FC);
  static const Color white = Color(0xFFFFFFFF);

  // accent
  static const Color dangerRed = Color(0xFFE94242);
  static const Color warningYellow = Color(0xFFFDCF41);
  static const Color succesGreen = Color(0xFF2CC069);
  static const Color safe = Color(0xFF7BCBCF);
}

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: Palette.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Palette.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: Palette.offWhite),
        ),
        backgroundColor: MaterialStateProperty.all(Palette.defaultBlue),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Palette.activeBlack),
      bodyText2: TextStyle(color: Palette.activeBlack),
      button: TextStyle(color: Palette.activeBlack),
      caption: TextStyle(color: Palette.activeBlack),
      headline1: TextStyle(color: Palette.activeBlack),
      headline2: TextStyle(color: Palette.activeBlack),
      headline3: TextStyle(color: Palette.activeBlack),
      headline4: TextStyle(color: Palette.activeBlack),
      headline5: TextStyle(color: Palette.activeBlack),
      headline6: TextStyle(color: Palette.activeBlack),
      overline: TextStyle(color: Palette.activeBlack),
      subtitle1: TextStyle(color: Palette.activeBlack),
      subtitle2: TextStyle(color: Palette.activeBlack),
    ),
  );
}

ThemeData get appThemeDark {
  return ThemeData(
    scaffoldBackgroundColor: Palette.activeBlack,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Palette.activeBlack,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: Palette.offWhite),
        ),
        backgroundColor: MaterialStateProperty.all(Palette.darkModeBlue),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Palette.offWhite),
      bodyText2: TextStyle(color: Palette.offWhite),
      button: TextStyle(color: Palette.offWhite),
      caption: TextStyle(color: Palette.offWhite),
      headline1: TextStyle(color: Palette.offWhite),
      headline2: TextStyle(color: Palette.offWhite),
      headline3: TextStyle(color: Palette.offWhite),
      headline4: TextStyle(color: Palette.offWhite),
      headline5: TextStyle(color: Palette.offWhite),
      headline6: TextStyle(color: Palette.offWhite),
      overline: TextStyle(color: Palette.offWhite),
      subtitle1: TextStyle(color: Palette.offWhite),
      subtitle2: TextStyle(color: Palette.offWhite),
    ),
  );
}
