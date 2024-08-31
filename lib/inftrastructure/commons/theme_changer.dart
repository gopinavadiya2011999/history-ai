import 'package:character_ai/inftrastructure/constant/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String _themeKey = 'theme_mode';

  final lightTheme =ConstantTheme.lightTheme;

  final darkTheme = ConstantTheme.darkTheme;

  Rx<ThemeData> currentTheme;

  ThemeController() : currentTheme = Rx<ThemeData>(ThemeData.light()) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    currentTheme.value = isDarkMode ? darkTheme : lightTheme;
  }

  Future<void> toggleTheme() async {
    final isDarkMode = currentTheme.value.brightness == Brightness.dark;

    currentTheme.value = isDarkMode ? lightTheme : darkTheme;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, !isDarkMode);
  }

  void applySystemTheme(Brightness brightness) {
    currentTheme.value = brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}
