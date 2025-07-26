import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/components/beat_indicator.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('BeatIndicator', () {
    testWidgets('現在の拍が正しく表示される', (tester) async {
      const currentBeat = 3;

      await tester.setupTargetWidget(
        const BeatIndicator(currentBeat: currentBeat),
      );

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('異なる拍数が正しく表示される', (tester) async {
      const testCases = [1, 2, 3, 4];

      for (final beat in testCases) {
        await tester.setupTargetWidget(
          BeatIndicator(currentBeat: beat),
        );

        expect(find.text(beat.toString()), findsOneWidget);
      }
    });

    testWidgets('Textウィジェットが表示される', (tester) async {
      await tester.setupTargetWidget(
        const BeatIndicator(currentBeat: 1),
      );

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('適切なスタイルが適用されている', (tester) async {
      await tester.setupTargetWidget(
        const BeatIndicator(currentBeat: 1),
      );

      final text = tester.widget<Text>(find.byType(Text));

      expect(text.style?.color, isNotNull);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('0の拍も正しく表示される', (tester) async {
      await tester.setupTargetWidget(
        const BeatIndicator(currentBeat: 0),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('大きな数値も正しく表示される', (tester) async {
      await tester.setupTargetWidget(
        const BeatIndicator(currentBeat: 999),
      );

      expect(find.text('999'), findsOneWidget);
    });
  });
}
