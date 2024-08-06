import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(),
    iconTheme: const IconThemeData(color: contentColorLightTheme),
    // textTheme: GoogleFonts.innerTextTheme(Theme.of(context).textTheme)
    //   .apply(bodyColor: contentColorLightTheme),
    colorScheme: const ColorScheme.light(
        primary: primaryColor, secondary: secondaryColor, error: errorColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: const AppBarTheme(),
    iconTheme: const IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.light(
        primary: primaryColor, secondary: secondaryColor, error: errorColor),
  );
}
