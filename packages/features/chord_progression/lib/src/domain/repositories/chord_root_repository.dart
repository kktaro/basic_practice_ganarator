import 'package:chord_progression/src/domain/entities/note.dart';

abstract interface class ChordRootRepository {
  Note generateRoot();
}
