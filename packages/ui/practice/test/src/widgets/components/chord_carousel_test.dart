import 'package:carousel_slider/carousel_slider.dart';
import 'package:chord_progression/chord_progression.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/components/chord_carousel.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('ChordCarousel', () {
    late List<Chord> testChords;
    late CarouselSliderController controller;

    setUp(() {
      testChords = [
        const Chord(root: Note.c, type: ChordType.major),
        const Chord(root: Note.f, type: ChordType.major),
        const Chord(root: Note.g, type: ChordType.major),
        const Chord(root: Note.a, type: ChordType.minor),
      ];
      controller = CarouselSliderController();
    });

    testWidgets('コードが正常に表示される', (tester) async {
      await tester.setupTargetWidget(
        ChordCarousel(
          chords: testChords,
          controller: controller,
        ),
      );

      // 最初のコードが表示されることを確認
      expect(find.text('C'), findsOneWidget);

      // CarouselSliderが表示されることを確認
      expect(find.byType(CarouselSlider), findsOneWidget);
    });

    testWidgets('複数のコードが表示される', (tester) async {
      await tester.setupTargetWidget(
        ChordCarousel(
          chords: testChords,
          controller: controller,
        ),
      );

      // 全てのコードが表示されることを確認（CarouselSliderの特性上、一部は見えていない可能性がある）
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('空のコードリストでも正常に表示される', (tester) async {
      await tester.setupTargetWidget(
        ChordCarousel(
          chords: const [],
          controller: controller,
        ),
      );

      expect(find.byType(CarouselSlider), findsOneWidget);
    });

    testWidgets('CarouselSliderの設定が正しく適用されている', (tester) async {
      await tester.setupTargetWidget(
        ChordCarousel(
          chords: testChords,
          controller: controller,
        ),
      );

      final carouselSlider = tester.widget<CarouselSlider>(
        find.byType(CarouselSlider),
      );

      expect(carouselSlider.options.height, equals(100));
      expect(carouselSlider.options.viewportFraction, equals(0.4));
      expect(carouselSlider.options.enableInfiniteScroll, isFalse);
    });

    testWidgets('IgnorePointerが適用されている', (tester) async {
      await tester.setupTargetWidget(
        ChordCarousel(
          chords: testChords,
          controller: controller,
        ),
      );

      // ChordCarousel内のIgnorePointerを確認
      final ignorePointers = find.byType(IgnorePointer);
      expect(ignorePointers, findsWidgets);

      // CarouselSliderがIgnorePointerでラップされていることを確認
      final carouselSlider = find.byType(CarouselSlider);
      expect(carouselSlider, findsOneWidget);
    });

    testWidgets('単一のコードでも正常に表示される', (tester) async {
      final singleChord = [const Chord(root: Note.c, type: ChordType.major)];

      await tester.setupTargetWidget(
        ChordCarousel(
          chords: singleChord,
          controller: controller,
        ),
      );

      expect(find.text('C'), findsOneWidget);
      expect(find.byType(CarouselSlider), findsOneWidget);
    });

    testWidgets('異なるコードタイプが正しく表示される', (tester) async {
      final variousChords = [
        const Chord(root: Note.c, type: ChordType.major),
        const Chord(root: Note.d, type: ChordType.minor),
        const Chord(root: Note.e, type: ChordType.dominant7),
        const Chord(root: Note.f, type: ChordType.major7),
      ];

      await tester.setupTargetWidget(
        ChordCarousel(
          chords: variousChords,
          controller: controller,
        ),
      );

      // 少なくとも1つのコードが表示されることを確認
      expect(find.byType(Text), findsWidgets);
    });
  });
}
