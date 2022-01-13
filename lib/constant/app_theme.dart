import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      // fontFamily: 'NotoSans',
      backgroundColor: darkThemeMainColor,
      primaryColor: appSubColor,
      canvasColor: darkThemeMainColor,
      primarySwatch: materialWhiteColor,
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle:
              TextStyle(color: Color.fromRGBO(235, 235, 235, 1), fontSize: 9),
          hintStyle:
              TextStyle(color: Color.fromRGBO(155, 155, 155, 1), fontSize: 8),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none),
      textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 13)),
      dividerTheme:
          const DividerThemeData(color: Color.fromRGBO(115, 115, 115, 1)),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: darkThemeMainColor,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: materialWhiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ));
}