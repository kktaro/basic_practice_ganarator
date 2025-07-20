import 'package:bass_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bass App loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that the app loads correctly with expected text
    expect(find.text('Bass App'), findsOneWidget);
    expect(find.text('日本語の確認サンプル'), findsOneWidget);
  });
}
