import 'package:chord_progression/src/domain/entities/chord_type.dart';
import 'package:chord_progression/src/domain/entities/note.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Chord {
  const Chord({
    required this.root,
    required this.type,
  });

  final Note root;
  final ChordType type;

  String get symbol => '${root.symbol}${type.symbol}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chord &&
          runtimeType == other.runtimeType &&
          root == other.root &&
          type == other.type;

  @override
  int get hashCode => root.hashCode ^ type.hashCode;

  @override
  String toString() => 'Chord(symbol: $symbol)';
}
