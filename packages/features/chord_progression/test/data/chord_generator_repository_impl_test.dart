import 'package:chord_progression/chord_progression.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chord_generator_repository_impl_test.mocks.dart';

@GenerateMocks([ChordRootRepository, ChordTypeRepository])
void main() {
  group('ChordGeneratorRepositoryImpl', () {
    late MockChordRootRepository mockRootRepository;
    late MockChordTypeRepository mockTypeRepository;
    late ChordGeneratorRepositoryImpl repository;

    setUp(() {
      mockRootRepository = MockChordRootRepository();
      mockTypeRepository = MockChordTypeRepository();
      repository = ChordGeneratorRepositoryImpl(
        rootRepository: mockRootRepository,
        typeRepository: mockTypeRepository,
      );
    });

    test(
      'generateChord returns a Chord with root and type from repositories',
      () {
        when(mockRootRepository.generateRoot()).thenReturn(Note.c);
        when(mockTypeRepository.generateType()).thenReturn(ChordType.major);

        final result = repository.generateChord();

        expect(result, isA<Chord>());
        expect(result.root, Note.c);
        expect(result.type, ChordType.major);
        expect(result.symbol, 'C');
        verify(mockRootRepository.generateRoot()).called(1);
        verify(mockTypeRepository.generateType()).called(1);
      },
    );

    test('generateChord works with different note and type combinations', () {
      when(mockRootRepository.generateRoot()).thenReturn(Note.f);
      when(mockTypeRepository.generateType()).thenReturn(ChordType.minor);

      final result = repository.generateChord();

      expect(result.root, Note.f);
      expect(result.type, ChordType.minor);
      expect(result.symbol, 'Fm');
    });

    test('generateChord works with seventh chords', () {
      when(mockRootRepository.generateRoot()).thenReturn(Note.g);
      when(mockTypeRepository.generateType()).thenReturn(ChordType.dominant7);

      final result = repository.generateChord();

      expect(result.root, Note.g);
      expect(result.type, ChordType.dominant7);
      expect(result.symbol, 'G7');
    });
  });
}
