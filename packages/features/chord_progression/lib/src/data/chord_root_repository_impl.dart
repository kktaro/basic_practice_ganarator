import 'dart:math';

import 'package:chord_progression/src/domain/entities/note.dart';
import 'package:chord_progression/src/domain/repositories/chord_root_repository.dart';

class ChordRootRepositoryImpl implements ChordRootRepository {
  ChordRootRepositoryImpl({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  Note generateRoot() {
    const values = Note.values;
    final index = _random.nextInt(values.length);
    return values[index];
  }
}
