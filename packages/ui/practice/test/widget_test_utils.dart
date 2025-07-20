import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  /// PumpとThemeの設定を行うヘルパー関数
  Future<void> setupTargetWidget(Widget widget) async {
    await pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: dummyTheme,
          home: widget,
        ),
      ),
    );
  }
}

ThemeData get dummyTheme =>
    ThemeData(colorSchemeSeed: Colors.amber, useMaterial3: true);
