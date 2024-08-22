import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData lightTheme= ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  );
  static ThemeData darkTheme=  ThemeData(
  scaffoldBackgroundColor: Colors.black,
  );
}