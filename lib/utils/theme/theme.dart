import 'package:flutter/material.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyAppTextTheme.lightTextTheme,
    elevatedButtonTheme: MyAppElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: MyAppTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyAppTextTheme.darkTextTheme,
    elevatedButtonTheme: MyAppElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: MyAppTextFormFieldTheme.darkInputDecorationTheme,
  );
}
