import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metronome/metronome.dart';
import 'package:core/core.dart';

void main() {
  group('MetronomeViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態が正しく設定される', () {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      final state = container.read(metronomeViewModelProvider);

      expect(state.bpm, 120);
      expect(state.isPlaying, false);
      expect(state.currentBeat, 1);
      expect(state.timeSignatureNumerator, 4);
      expect(state.timeSignatureDenominator, 4);
    });

    test('BPM変更が正常に動作する', () {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      
      viewModel.changeBpm(140);
      final state = container.read(metronomeViewModelProvider);

      expect(state.bpm, 140);
    });

    test('無効なBPMは変更されない', () {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      
      viewModel.changeBpm(20); // 最小値未満
      final state = container.read(metronomeViewModelProvider);

      expect(state.bpm, 120); // 初期値のまま
    });

    test('メトロノーム開始が正常に動作する', () async {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      
      await viewModel.start();
      final state = container.read(metronomeViewModelProvider);

      expect(state.isPlaying, true);
    });

    test('メトロノーム停止が正常に動作する', () async {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      
      // 一度開始してから停止
      await viewModel.start();
      await viewModel.stop();
      final state = container.read(metronomeViewModelProvider);

      expect(state.isPlaying, false);
      expect(state.currentBeat, 1); // 停止時に拍がリセットされる
    });

    test('ボリューム設定メソッドが存在する', () {
      final viewModel = container.read(metronomeViewModelProvider.notifier);
      
      expect(viewModel.setVolume, isA<Function>());
    });
  });
}