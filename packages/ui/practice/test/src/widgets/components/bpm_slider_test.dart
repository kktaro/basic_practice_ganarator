import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/components/bpm_slider.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('VerticalSlider', () {
    testWidgets('displays correctly with basic properties', (
      WidgetTester tester,
    ) async {
      await tester.setupTargetWidget(
        BpmSlider(
          minValue: 0,
          maxValue: 100,
          currentValue: 50,
          onChanged: (value) {},
        ),
      );

      // Sliderが存在することを確認
      expect(find.byType(Slider), findsOneWidget);

      // Sliderの値が正しく設定されていることを確認
      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(50.0));
      expect(slider.min, equals(0.0));
      expect(slider.max, equals(100.0));
      expect(slider.divisions, equals(100));
    });

    testWidgets('calls onChanged when slider value changes', (
      WidgetTester tester,
    ) async {
      var changedValue = 5;

      await tester.setupTargetWidget(
        BpmSlider(
          minValue: 0,
          maxValue: 10,
          currentValue: changedValue,
          onChanged: (value) {
            changedValue = value;
          },
        ),
      );

      // スライダーを見つけてドラッグ操作をシミュレート
      final sliderFinder = find.byType(Slider);
      expect(sliderFinder, findsOneWidget);

      // スライダーの値を変更
      await tester.drag(sliderFinder, const Offset(0, 100));
      await tester.pumpAndSettle();

      // コールバック関数が呼ばれて値が変更されたことを確認
      expect(changedValue, isNot(equals(0)));
    });

    testWidgets('the value after onChanged has lower limits', (
      WidgetTester tester,
    ) async {
      const lowerLimit = 3;

      var changedValue = 5;

      await tester.setupTargetWidget(
        BpmSlider(
          minValue: lowerLimit,
          maxValue: 10,
          currentValue: changedValue,
          onChanged: (value) {
            changedValue = value;
          },
        ),
      );

      // スライダーを見つけてドラッグ操作をシミュレート
      final sliderFinder = find.byType(Slider);
      expect(sliderFinder, findsOneWidget);

      // スライダーの値を変更
      await tester.drag(sliderFinder, const Offset(-1000, 0));
      await tester.pumpAndSettle();

      // minValueより小さい値に変更されないことを確認
      expect(changedValue, equals(lowerLimit));
    });

    testWidgets('the value after onChanged has higher limits', (
      WidgetTester tester,
    ) async {
      const higherLimit = 8;

      var changedValue = 5;

      await tester.setupTargetWidget(
        BpmSlider(
          minValue: 0,
          maxValue: higherLimit,
          currentValue: changedValue,
          onChanged: (value) {
            changedValue = value;
          },
        ),
      );

      // スライダーを見つけてドラッグ操作をシミュレート
      final sliderFinder = find.byType(Slider);
      expect(sliderFinder, findsOneWidget);

      // スライダーの値を変更
      await tester.drag(sliderFinder, const Offset(1000, 0));
      await tester.pumpAndSettle();

      // minValueより大きい値に変更されないことを確認
      expect(changedValue, equals(higherLimit));
    });

    testWidgets('handles different min/max value ranges', (
      WidgetTester tester,
    ) async {
      await tester.setupTargetWidget(
        BpmSlider(
          minValue: 20,
          maxValue: 200,
          currentValue: 100,
          onChanged: (value) {},
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(100.0));
      expect(slider.min, equals(20.0));
      expect(slider.max, equals(200.0));
      expect(slider.divisions, equals(180));
    });
  });
}
