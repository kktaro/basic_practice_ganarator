import 'package:bass_app/widgets/bass_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.read(lightBassAppThemeProvider);
    final darkTheme = ref.read(darkBassAppThemeProvider);

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      home: Scaffold(
        appBar: AppBar(title: const Text('Bass App')),
        body: const Center(child: Text('日本語の確認サンプル')),
      ),
    );
  }
}
