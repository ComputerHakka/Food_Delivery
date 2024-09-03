import 'package:flutter/material.dart';

const Color accentColor = Color(0xFF1EB1E7);
const Color textFieldPassiveColor = Color(0xFFE2E8F0);
const Color containersColor = Color.fromARGB(255, 229, 231, 236);
const Color unselectedItemColor = Color(0xFFADBECE);
const Color borderColor = Color(0xFFE2E8F0);
const Color textFieldTextColor = Color(0xFF64748B);
const Color lightButton = Color(0xFFD6E7F8);
const Color splashButtonColor = Color.fromARGB(255, 133, 216, 255);

final ThemeData appTheme = ThemeData(
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    useMaterial3: true,
    bottomSheetTheme: BottomSheetThemeData());

const AppBarTheme appBarTheme = AppBarTheme(
  scrolledUnderElevation: 0,
  color: Colors.transparent,
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 21,
  ),
);
