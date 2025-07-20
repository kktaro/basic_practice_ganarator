import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Note enum has correct values', () {
    expect(Note.values.length, 7);
    expect(Note.c.symbol, 'C');
    expect(Note.g.symbol, 'G');
  });
}
