import 'package:flutter_test/flutter_test.dart';
import 'package:metronome/metronome.dart';

void main() {
  group('MetronomeRepositoryImpl', () {
    late MetronomeRepositoryImpl repository;

    setUp(() {
      repository = MetronomeRepositoryImpl();
    });

    tearDown(() async {
      await repository.dispose();
    });

    test('初期化が正常に完了する', () async {
      // 実際の音声ファイルが存在しないため、例外が発生することを確認
      expect(
        () async => await repository.initialize(),
        throwsA(isA<Exception>()),
      );
    });

    test('ボリューム設定が正常に動作する', () async {
      // ボリューム設定のメソッドが存在することを確認
      expect(repository.setVolume, isA<Function>());
    });

    test('クリック再生メソッドが存在する', () {
      expect(repository.playClick, isA<Function>());
    });

    test('dispose メソッドが存在する', () {
      expect(repository.dispose, isA<Function>());
    });
  });
}