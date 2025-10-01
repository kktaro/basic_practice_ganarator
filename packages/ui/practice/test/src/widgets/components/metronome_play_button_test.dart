import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/components/metronome_play_button.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('MetronomePlayButton', () {
    testWidgets('停止時に再生アイコンが表示される', (tester) async {
      await tester.setupTargetWidget(
        MetronomePlayButton(
          isPlaying: false,
          onPressed: () {},
        ),
      );

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsNothing);
    });

    testWidgets('再生時に停止アイコンが表示される', (tester) async {
      await tester.setupTargetWidget(
        MetronomePlayButton(
          isPlaying: true,
          onPressed: () {},
        ),
      );

      expect(find.byIcon(Icons.stop), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsNothing);
    });

    testWidgets('ボタンが押下されるとコールバックが呼ばれる', (tester) async {
      var isPressed = false;

      await tester.setupTargetWidget(
        MetronomePlayButton(
          isPlaying: false,
          onPressed: () {
            isPressed = true;
          },
        ),
      );

      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();

      expect(isPressed, isTrue);
    });

    testWidgets('OutlinedButtonが表示される', (tester) async {
      await tester.setupTargetWidget(
        MetronomePlayButton(
          isPlaying: false,
          onPressed: () {},
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('適切なスタイルが適用されている', (tester) async {
      await tester.setupTargetWidget(
        MetronomePlayButton(
          isPlaying: false,
          onPressed: () {},
        ),
      );

      final button = tester.widget<OutlinedButton>(
        find.byType(OutlinedButton),
      );

      expect(button.style?.backgroundColor, isNotNull);
      expect(button.style?.shape, isNotNull);
    });
  });
}
