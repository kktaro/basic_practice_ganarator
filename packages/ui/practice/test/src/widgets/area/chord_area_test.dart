import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice/src/widgets/area/chord_area.dart';
import 'package:practice/src/widgets/components/chord_carousel.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('ChordArea', () {
    late List<Chord> testChords;

    setUp(() {
      testChords = [
        const Chord(root: Note.c, type: ChordType.major),
        const Chord(root: Note.f, type: ChordType.major),
        const Chord(root: Note.g, type: ChordType.major),
        const Chord(root: Note.a, type: ChordType.minor),
      ];
    });

    testWidgets('ChordCarouselが正常に表示される', (tester) async {
      await tester.setupTargetWidget(
        ChordArea(chords: testChords),
      );

      expect(find.byType(ChordCarousel), findsOneWidget);
    });

    testWidgets('渡されたchordsがChordCarouselに正しく渡される', (tester) async {
      await tester.setupTargetWidget(
        ChordArea(chords: testChords),
      );

      final chordCarouselWidget = tester.widget<ChordCarousel>(
        find.byType(ChordCarousel),
      );

      expect(chordCarouselWidget.chords, equals(testChords));
    });

    testWidgets('空のコードリストでも正常に表示される', (tester) async {
      await tester.setupTargetWidget(
        const ChordArea(chords: []),
      );

      expect(find.byType(ChordCarousel), findsOneWidget);

      final chordCarouselWidget = tester.widget<ChordCarousel>(
        find.byType(ChordCarousel),
      );

      expect(chordCarouselWidget.chords, isEmpty);
    });
  });
}
