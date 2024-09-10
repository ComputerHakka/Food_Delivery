import 'package:flutter/material.dart';

const Color accentColor = Colors.red;
const Color textFieldPassiveColor = Color(0xFFE2E8F0);
const Color containersColor = Color(0xFFF2F6F9);
const Color unselectedItemColor = Color(0xFFADBECE);
const Color borderColor = Color(0xFFE2E8F0);
const Color textFieldTextColor = Color(0xFF64748B);
const Color lightButton = Color(0xFFD6E7F8);
const Color splashButtonColor = Color.fromARGB(255, 255, 78, 78);
const Color shadowColor = Color.fromARGB(122, 251, 253, 255);
const Color mainScreenTitleColor = Color(0xFFEDEFEA);
const Color onPrimaryContainers = Color(0xFFFAD2D3);

final ThemeData appTheme = ThemeData(
  fontFamily: 'Montserrat',
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(
        allowEnterRouteSnapshotting: false,
      ),
    },
  ),
  appBarTheme: appBarTheme,
  colorScheme: ColorScheme.fromSeed(seedColor: accentColor),
  useMaterial3: true,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Colors.red),
  )),
  outlinedButtonTheme: outlinedButtonTheme,
  checkboxTheme: checkboxTheme,
  inputDecorationTheme: inputDecorationTheme,
  radioTheme: radioTheme,
  switchTheme: switchTheme,
  chipTheme: chipTheme,
);

const OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: containersColor, width: 0.5),
      ),
    ),
    foregroundColor: WidgetStatePropertyAll(Colors.black),
  ),
);

final RadioThemeData radioTheme = RadioThemeData(
  fillColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.red;
      }
      return Colors.red;
    },
  ),
);

const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
);

const ChipThemeData chipTheme = ChipThemeData(
  backgroundColor: containersColor,
  side: BorderSide(color: Colors.transparent),
  // shape: RoundedRectangleBorder(
  //   side: BorderSide(color: Colors.transparent),
  // ),
);

final SwitchThemeData switchTheme = SwitchThemeData(
  thumbColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.grey;
    },
  ),
  trackColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.red;
      }
      return Colors.white;
    },
  ),
);

final CheckboxThemeData checkboxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.red;
      }
      return Colors.white;
    },
  ),
);

final AppBarTheme appBarTheme = AppBarTheme(
  scrolledUnderElevation: 3,
  elevation: 3,
  surfaceTintColor: Colors.white,
  shadowColor: shadowColor,
  color: Colors.white,
  titleTextStyle: textStyleMain,
);

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return accentColor;
        } else if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        }
        return accentColor;
      },
    ),
    textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
    foregroundColor: const WidgetStatePropertyAll(Colors.white),
    overlayColor: const WidgetStatePropertyAll(splashButtonColor),
    elevation: const WidgetStatePropertyAll(5),
  ),
);

TextStyle textStyleMain = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 21,
    fontFamily: 'Montserrat');
