import 'package:flutter_test/flutter_test.dart';
import 'package:practice/practice.dart';

import '../widget_test_utils.dart';

void main() {
  testWidgets('Bass App loads correctly', (WidgetTester tester) async {
    await tester.setupTargetWidget(const PracticeScreen());

    // Verify that the app loads correctly with expected text
    expect(find.text('Bass App'), findsOneWidget);
    expect(find.text('日本語の確認サンプル'), findsOneWidget);
  });
}
