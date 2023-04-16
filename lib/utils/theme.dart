import 'package:campuskonnect/utils/colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final primaryColor = Color(0xffffffff);

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Appcolors.darkprimary,
    canvasColor: Appcolors.darkprimary,
    appBarTheme: const AppBarTheme(color: Appcolors.darkprimary),
  );
  static final light = ThemeData(
    scaffoldBackgroundColor: Appcolors.lightprimary,
    colorScheme: const ColorScheme.light(),
    canvasColor: Appcolors.lightprimary,
    appBarTheme: const AppBarTheme(color: Appcolors.lightprimary),
  );
}
