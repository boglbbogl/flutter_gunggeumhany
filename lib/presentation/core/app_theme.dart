import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      fontFamily: AppFonts().notoSans,
      backgroundColor: darkThemeMainColor,
      primaryColor: appSubColor,
      canvasColor: darkThemeMainColor,
      primarySwatch: materialWhiteColor,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white, fontSize: 10),
        hintStyle:
            TextStyle(color: Color.fromRGBO(155, 155, 155, 1), fontSize: 10),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
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
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ));
}
