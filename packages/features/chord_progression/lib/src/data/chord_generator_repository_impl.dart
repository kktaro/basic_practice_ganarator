import 'package:chord_progression/src/domain/entities/chord.dart';
import 'package:chord_progression/src/domain/repositories/chord_generator_repository.dart';
import 'package:chord_progression/src/domain/repositories/chord_root_repository.dart';
import 'package:chord_progression/src/domain/repositories/chord_type_repository.dart';

class ChordGeneratorRepositoryImpl implements ChordGeneratorRepository {
  const ChordGeneratorRepositoryImpl({
    required this.rootRepository,
    required this.typeRepository,
  });

  final ChordRootRepository rootRepository;
  final ChordTypeRepository typeRepository;

  @override
  Chord generateChord() {
    final root = rootRepository.generateRoot();
    final type = typeRepository.generateType();
    return Chord(root: root, type: type);
  }
}
