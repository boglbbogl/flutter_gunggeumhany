import 'package:flutter/material.dart';

late Size size;
late ThemeData theme;

// Color appMainColor = const Color.fromRGBO(104, 165, 247, 1);
// Color appSubColor = const Color.fromRGBO(247, 82, 142, 1);
// Green
Color appMainColor = const Color.fromRGBO(107, 232, 204, 1);
// Orange
Color appSubColor = const Color.fromRGBO(208, 84, 69, 1);
Color darkThemeMainColor = const Color.fromRGBO(31, 31, 31, 1);
Color darkThemeBlackCardColor = const Color.fromRGBO(51, 51, 51, 1);
Color darkThemeNavyCardColor = const Color.fromRGBO(46, 47, 64, 1);
Color lightThemeMainColor = const Color.fromRGBO(235, 235, 235, 1);

const MaterialColor materialBlackColor = MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0x00000000),
    100: Color(0x01000000),
    200: Color(0x02000000),
    300: Color(0x03000000),
    400: Color(0x04000000),
    500: Color(0x05000000),
    600: Color(0x06000000),
    700: Color(0x07000000),
    800: Color(0x08000000),
    900: Color(0x09000000),
  },
);

const MaterialColor materialWhiteColor = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0x1FFFFFFF),
    200: Color(0x2FFFFFFF),
    300: Color(0x3FFFFFFF),
    400: Color(0x4FFFFFFF),
    500: Color(0x5FFFFFFF),
    600: Color(0x6FFFFFFF),
    700: Color(0x7FFFFFFF),
    800: Color(0x8FFFFFFF),
    900: Color(0x9FFFFFFF),
  },
);
