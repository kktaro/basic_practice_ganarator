import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/area/metronome_area.dart';
import 'package:practice/src/widgets/components/beat_indicator.dart';
import 'package:practice/src/widgets/components/metronome_play_button.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('MetronomeArea', () {
    testWidgets('BeatIndicatorとMetronomePlayButtonが表示される', (tester) async {
      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: false,
          currentBeat: 1,
          onPlayPressed: () {},
        ),
      );

      expect(find.byType(BeatIndicator), findsOneWidget);
      expect(find.byType(MetronomePlayButton), findsOneWidget);
    });

    testWidgets('現在の拍が正しくBeatIndicatorに渡される', (tester) async {
      const currentBeat = 3;

      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: false,
          currentBeat: currentBeat,
          onPlayPressed: () {},
        ),
      );

      final beatIndicator = tester.widget<BeatIndicator>(
        find.byType(BeatIndicator),
      );

      expect(beatIndicator.currentBeat, equals(currentBeat));
    });

    testWidgets('再生状態が正しくMetronomePlayButtonに渡される', (tester) async {
      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: true,
          currentBeat: 1,
          onPlayPressed: () {},
        ),
      );

      final playButton = tester.widget<MetronomePlayButton>(
        find.byType(MetronomePlayButton),
      );

      expect(playButton.isPlaying, isTrue);
    });

    testWidgets('PlayButtonのコールバックが正しく動作する', (tester) async {
      var wasPressed = false;

      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: false,
          currentBeat: 1,
          onPlayPressed: () {
            wasPressed = true;
          },
        ),
      );

      await tester.tap(find.byType(MetronomePlayButton));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('異なる拍数でも正しく表示される', (tester) async {
      bool inactivePredicate(Widget widget) =>
          widget is Container &&
          widget.decoration ==
              const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              );

      const testBeats = [1, 2, 3, 4];

      for (final beat in testBeats) {
        await tester.setupTargetWidget(
          MetronomeArea(
            isPlaying: false,
            currentBeat: beat,
            onPlayPressed: () {},
          ),
        );

        expect(
          find.byWidgetPredicate(inactivePredicate),
          findsNWidgets(4 - beat),
        );
      }
    });

    testWidgets('停止時と再生時の状態が正しく反映される', (tester) async {
      // 停止時のテスト
      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: false,
          currentBeat: 1,
          onPlayPressed: () {},
        ),
      );

      final playButtonStopped = tester.widget<MetronomePlayButton>(
        find.byType(MetronomePlayButton),
      );
      expect(playButtonStopped.isPlaying, isFalse);

      // 再生時のテスト
      await tester.setupTargetWidget(
        MetronomeArea(
          isPlaying: true,
          currentBeat: 2,
          onPlayPressed: () {},
        ),
      );

      final playButtonPlaying = tester.widget<MetronomePlayButton>(
        find.byType(MetronomePlayButton),
      );
      expect(playButtonPlaying.isPlaying, isTrue);
    });
  });
}
