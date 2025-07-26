import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/components/beat_indicator.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('BeatIndicator', () {
    bool inactivePredicate(Widget widget) =>
        widget is Container &&
        widget.decoration ==
            const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            );

    testWidgets('現在の拍が正しく表示される', (tester) async {
      const currentBeat = 2;

      await tester.setupTargetWidget(
        const BeatIndicator(
          maxBeats: 4,
          currentBeat: currentBeat,
        ),
      );

      expect(find.byWidgetPredicate(inactivePredicate), findsNWidgets(2));
    });

    testWidgets('現在の拍が正しく表示される', (tester) async {
      const currentBeat = 4;

      await tester.setupTargetWidget(
        const BeatIndicator(
          maxBeats: 4,
          currentBeat: currentBeat,
        ),
      );

      expect(find.byWidgetPredicate(inactivePredicate), findsNothing);
    });

    testWidgets('最大拍数によりライトの数が変更されること', (tester) async {
      const currentBeat = 2;

      await tester.setupTargetWidget(
        const BeatIndicator(
          maxBeats: 10,
          currentBeat: currentBeat,
        ),
      );

      expect(find.byWidgetPredicate(inactivePredicate), findsNWidgets(8));
    });
  });
}
