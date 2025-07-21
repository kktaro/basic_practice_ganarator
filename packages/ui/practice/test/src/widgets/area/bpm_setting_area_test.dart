import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/area/bpm_setting_area.dart';
import 'package:practice/src/widgets/components/bpm_display_text.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('BpmSettingArea', () {
    testWidgets('各コンポーネントが正常に表示される', (tester) async {
      const bpm = 140;

      await tester.setupTargetWidget(
        BpmSettingArea(
          currentBpm: bpm,
          onBpmChanged: (_) {},
        ),
      );

      expect(find.byType(BpmDisplayText), findsOneWidget);
      expect(find.text('140'), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    group('ボタン押下によるBPM変更が正常に動作すること', () {
      const initialBpm = 140;
      testWidgets('incrementalボタン', (tester) async {
        var bpm = initialBpm;
        await tester.setupTargetWidget(
          BpmSettingArea(
            currentBpm: bpm,
            onBpmChanged: (value) {
              bpm = value;
            },
          ),
        );

        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        expect(bpm, initialBpm + 1);
      });
      testWidgets('decrementalボタン', (tester) async {
        var bpm = initialBpm;
        await tester.setupTargetWidget(
          BpmSettingArea(
            currentBpm: bpm,
            onBpmChanged: (value) {
              bpm = value;
            },
          ),
        );

        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        expect(bpm, initialBpm - 1);
      });
    });

    group('スライダーによるBPM変更が正常に動作すること', () {
      const initialBpm = 140;
      testWidgets('スライダーを左にドラッグしてBPMが最小値になること', (tester) async {
        var bpm = initialBpm;
        await tester.setupTargetWidget(
          BpmSettingArea(
            currentBpm: bpm,
            onBpmChanged: (value) {
              bpm = value;
            },
          ),
        );

        final sliderFinder = find.byType(Slider);
        expect(sliderFinder, findsOneWidget);

        // スライダーをドラッグして値を変更
        await tester.drag(sliderFinder, const Offset(-1000, 0));
        await tester.pumpAndSettle();

        // BPMが変更されたことを確認
        expect(bpm, minBpm);
      });

      testWidgets('スライダーを右にドラッグしてBPMが最大値になること', (tester) async {
        var bpm = initialBpm;
        await tester.setupTargetWidget(
          BpmSettingArea(
            currentBpm: bpm,
            onBpmChanged: (value) {
              bpm = value;
            },
          ),
        );

        final sliderFinder = find.byType(Slider);
        expect(sliderFinder, findsOneWidget);

        // スライダーをドラッグして値を変更
        await tester.drag(sliderFinder, const Offset(1000, 0));
        await tester.pumpAndSettle();

        // BPMが変更されたことを確認
        expect(bpm, maxBpm);
      });
    });
  });
}
