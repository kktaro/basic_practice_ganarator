import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MetronomeState', () {
    test('デフォルト値の確認', () {
      const state = MetronomeState();

      expect(state.bpm, 120);
      expect(state.isPlaying, false);
      expect(state.currentBeat, 1);
      expect(state.timeSignatureNumerator, 4);
      expect(state.timeSignatureDenominator, 4);
    });

    test('BPM有効性チェック', () {
      const validState = MetronomeState();
      const invalidLowState = MetronomeState(bpm: 20);
      const invalidHighState = MetronomeState(bpm: 400);

      expect(validState.isValidBpm, true);
      expect(invalidLowState.isValidBpm, false);
      expect(invalidHighState.isValidBpm, false);
    });

    test('拍間隔計算', () {
      const state60 = MetronomeState(bpm: 60);
      const state120 = MetronomeState();

      expect(state60.beatIntervalMs, 1000); // 60BPM = 1秒間隔
      expect(state120.beatIntervalMs, 500); // 120BPM = 0.5秒間隔
    });

    test('次の拍に進む', () {
      const state = MetronomeState();
      final nextState = state.nextBeat();

      expect(nextState.currentBeat, 2);
    });

    test('最後の拍から最初の拍に戻る', () {
      const state = MetronomeState(currentBeat: 4);
      final nextState = state.nextBeat();

      expect(nextState.currentBeat, 1);
    });

    test('メトロノーム開始', () {
      const state = MetronomeState();
      final startedState = state.start();

      expect(startedState.isPlaying, true);
    });

    test('メトロノーム停止', () {
      const state = MetronomeState(isPlaying: true, currentBeat: 3);
      final stoppedState = state.stop();

      expect(stoppedState.isPlaying, false);
      expect(stoppedState.currentBeat, 1); // 停止時に拍をリセット
    });

    test('BPM変更（有効な値）', () {
      const state = MetronomeState();
      final changedState = state.changeBpm(140);

      expect(changedState.bpm, 140);
    });

    test('BPM変更（無効な値）', () {
      const state = MetronomeState();
      final unchangedState = state.changeBpm(20); // 最小値未満

      expect(unchangedState.bpm, 120); // 変更されない
    });

    test('copyWithメソッドの動作確認', () {
      const originalState = MetronomeState();
      final modifiedState = originalState.copyWith(bpm: 140, isPlaying: true);

      expect(modifiedState.bpm, 140);
      expect(modifiedState.isPlaying, true);
      expect(modifiedState.currentBeat, 1); // 変更されていない値はそのまま
    });
  });
}
