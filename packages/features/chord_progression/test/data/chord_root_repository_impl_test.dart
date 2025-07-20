import 'dart:math';

import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chord_root_repository_impl_test.mocks.dart';

@GenerateMocks([Random])
void main() {
  group('ChordRootRepositoryImpl', () {
    test('generateRoot returns a Note', () {
      final repository = ChordRootRepositoryImpl();
      final result = repository.generateRoot();

      expect(result, isA<Note>());
      expect(Note.values.contains(result), isTrue);
    });

    test('generateRoot uses injected Random', () {
      final mockRandom = MockRandom();
      when(mockRandom.nextInt(any)).thenReturn(0);

      final repository = ChordRootRepositoryImpl(random: mockRandom);
      final result = repository.generateRoot();

      expect(result, Note.c);
      verify(mockRandom.nextInt(7)).called(1);
    });

    test(
      'generateRoot returns different notes for different random values',
      () {
        final mockRandom = MockRandom();
        when(mockRandom.nextInt(any)).thenReturn(6);

        final repository = ChordRootRepositoryImpl(random: mockRandom);
        final result = repository.generateRoot();

        expect(result, Note.b);
      },
    );
  });
}
