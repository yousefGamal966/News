import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryColor = Color(0xFF39A552);
  static ThemeData theme  = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),

      )
      ),
      centerTitle: true
          
    ),
      drawerTheme: DrawerThemeData(

  ),
    indicatorColor: primaryColor
    
  );
}

