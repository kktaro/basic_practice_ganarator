import 'dart:math';

import 'package:chord_progression/src/domain/entities/chord_type.dart';
import 'package:chord_progression/src/domain/repositories/chord_type_repository.dart';

class ChordTypeRepositoryImpl implements ChordTypeRepository {
  ChordTypeRepositoryImpl({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  ChordType generateType() {
    const values = ChordType.values;
    final index = _random.nextInt(values.length);
    return values[index];
  }
}
