import 'package:flutter/material.dart';

class ThemeProv with ChangeNotifier {
  ThemeMode mode = ThemeMode.system;

  void setThemeMode(ThemeMode mode){
    this.mode = mode;
    // notifyListeners();
  }
}