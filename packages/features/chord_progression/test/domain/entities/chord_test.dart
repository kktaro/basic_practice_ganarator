import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Chord', () {
    test('symbol returns correct chord symbol', () {
      const chord1 = Chord(root: Note.c, type: ChordType.major);
      expect(chord1.symbol, 'C');

      const chord2 = Chord(root: Note.a, type: ChordType.minor);
      expect(chord2.symbol, 'Am');

      const chord3 = Chord(root: Note.g, type: ChordType.dominant7);
      expect(chord3.symbol, 'G7');

      const chord4 = Chord(root: Note.f, type: ChordType.major7);
      expect(chord4.symbol, 'FM7');
    });

    test('equality works correctly', () {
      const chord1 = Chord(root: Note.c, type: ChordType.major);
      const chord2 = Chord(root: Note.c, type: ChordType.major);
      const chord3 = Chord(root: Note.d, type: ChordType.major);

      expect(chord1, equals(chord2));
      expect(chord1, isNot(equals(chord3)));
    });

    test('hashCode works correctly', () {
      const chord1 = Chord(root: Note.c, type: ChordType.major);
      const chord2 = Chord(root: Note.c, type: ChordType.major);

      expect(chord1.hashCode, equals(chord2.hashCode));
    });

    group('toString returns correct representation', () {
      const cases = [
        (Chord(root: Note.c, type: ChordType.major), 'C'),
        (Chord(root: Note.d, type: ChordType.major), 'D'),
        (Chord(root: Note.e, type: ChordType.major), 'E'),
        (Chord(root: Note.f, type: ChordType.major), 'F'),
        (Chord(root: Note.g, type: ChordType.major), 'G'),
        (Chord(root: Note.a, type: ChordType.major), 'A'),
        (Chord(root: Note.b, type: ChordType.major), 'B'),
        (Chord(root: Note.c, type: ChordType.minor), 'Cm'),
        (Chord(root: Note.c, type: ChordType.dominant7), 'C7'),
        (Chord(root: Note.c, type: ChordType.major7), 'CM7'),
      ];
      for (final testCase in cases) {
        final chord = testCase.$1;
        final expectedString = testCase.$2;

        test('toString returns $expectedString for $chord', () {
          expect(chord.toString(), expectedString);
        });
      }
    });
  });
}
