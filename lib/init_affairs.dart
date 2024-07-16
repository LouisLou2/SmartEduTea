import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';
import 'package:smart_edu_tea/style/theme_vault.dart';

void uiInit(){
  ThemeVault.light = ThemeVault.light.copyWith(
    colorScheme: ThemeVault.light.colorScheme.copyWith(
      onInverseSurface: const Color(0xfff6f6f9),
      surfaceContainerHighest: const Color(0xfff8f8f9),
      surfaceContainerHigh: const Color(0xfff8f8f9),
    ),
  );
  StyleScheme.setOnSuface(
    lightOnSufColor: ThemeVault.light.colorScheme.onSurface,
    darkOnSufColor: ThemeVault.dark.colorScheme.onSurface,
    lightSufColor: ThemeVault.light.colorScheme.surface,
    darkSufColor: ThemeVault.dark.colorScheme.surface,
  );
}