import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Note enum has correct values', () {
    expect(Note.values.length, 7);
    expect(Note.c.symbol, 'C');
    expect(Note.g.symbol, 'G');
  });

  test('ChordType enum has correct values', () {
    expect(ChordType.values.length, 4);
    expect(ChordType.major.symbol, '');
    expect(ChordType.minor.symbol, 'm');
    expect(ChordType.dominant7.symbol, '7');
    expect(ChordType.major7.symbol, 'M7');
  });
}
