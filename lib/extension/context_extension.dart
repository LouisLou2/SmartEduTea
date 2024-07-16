import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
extension ThemeColorSchemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension ThemeTextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}