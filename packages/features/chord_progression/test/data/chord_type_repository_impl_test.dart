import 'dart:math';

import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chord_type_repository_impl_test.mocks.dart';

@GenerateMocks([Random])
void main() {
  group('ChordTypeRepositoryImpl', () {
    test('generateType returns a ChordType', () {
      final repository = ChordTypeRepositoryImpl();
      final result = repository.generateType();

      expect(result, isA<ChordType>());
      expect(ChordType.values.contains(result), isTrue);
    });

    test('generateType uses injected Random', () {
      final mockRandom = MockRandom();
      when(mockRandom.nextInt(any)).thenReturn(0);

      final repository = ChordTypeRepositoryImpl(random: mockRandom);
      final result = repository.generateType();

      expect(result, ChordType.major);
      verify(mockRandom.nextInt(4)).called(1);
    });

    test(
      'generateType returns different types for different random values',
      () {
        final mockRandom = MockRandom();
        when(mockRandom.nextInt(any)).thenReturn(3);

        final repository = ChordTypeRepositoryImpl(random: mockRandom);
        final result = repository.generateType();

        expect(result, ChordType.major7);
      },
    );
  });
}
