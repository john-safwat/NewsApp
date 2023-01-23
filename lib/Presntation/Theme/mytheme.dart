import 'package:flutter/material.dart';

class MyTheme {
  static const Color Green =  Color(0xFF39A552);
  static const Color Gray =  Color(0xFF4F5A69);
  static const Color Black=  Color(0xFF303030);
  static ThemeData Light =  ThemeData(
    primaryColor: Green,
    accentColor: Gray,
    appBarTheme: AppBarTheme(
      backgroundColor: Green ,
      elevation: 0 ,
      centerTitle: true ,
      shape: RoundedRectangleBorder (
        borderRadius: BorderRadius.circular(20)
      )
    ),
  );
}