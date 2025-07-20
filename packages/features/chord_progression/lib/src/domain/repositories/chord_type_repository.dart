import 'package:chord_progression/src/domain/entities/chord_type.dart';

// リポジトリのインターフェースクラスとして使用することを明示するため警告を無視
// ignore: one_member_abstracts
abstract interface class ChordTypeRepository {
  ChordType generateType();
}
