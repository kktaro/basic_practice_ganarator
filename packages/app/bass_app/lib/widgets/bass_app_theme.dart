import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bass_app_theme.g.dart';

@riverpod
ThemeData lightBassAppTheme(Ref ref) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: _getColorScheme(
      Brightness.light,
    ),
  );
}

@riverpod
ThemeData darkBassAppTheme(Ref ref) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: _getColorScheme(
      Brightness.dark,
    ),
  );
}

ColorScheme _getColorScheme(
  Brightness brightness,
) {
  return ColorScheme.fromSeed(
    seedColor: const Color(0xFF004c71),
    brightness: brightness,
  );
}
