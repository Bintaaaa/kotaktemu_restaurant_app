import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff8DA99F);
final Color darkPrimaryColor = Colors.grey.shade900;
const Color hardGreenColor = Color(0xff4C8772);
const Color yellowColor = Color(0xffF3E242);
const Color greyColor = Color(0xff8B8B8B);
const Color softGreyColor = Color(0xffDEDEDE);
const Color middleGreyColor = Color(0xffF3F3F3);
const Color whiteColor = Color(0xffFFFFFF);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: 'Rubik',
  textTheme: TextStyleTheme,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
    foregroundColor: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: darkPrimaryColor,
  fontFamily: 'Rubik',
  textTheme: darkTextStyleTheme,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkPrimaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
    foregroundColor: Colors.black,
  ),
);

// TEXT
const TextStyleTheme = TextTheme(
  headline1: TextStyle(color: Colors.black, fontSize: 33, fontWeight: FontWeight.w600),
  headline2: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
  headline3: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  bodyText1: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
  bodyText2: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
);
const darkTextStyleTheme = TextTheme(
  headline1: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w600),
  headline2: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
  headline3: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
  bodyText1: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
  bodyText2: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
);
