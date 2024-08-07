import 'package:assignment7todo/themes/app_palettes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalettes.backgroundColor,  
    ),
  );
}