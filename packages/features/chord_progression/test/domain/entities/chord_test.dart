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

    test('toString returns correct representation', () {
      const chord = Chord(root: Note.c, type: ChordType.minor);
      expect(chord.toString(), 'Chord(symbol: Cm)');
    });
  });
}
