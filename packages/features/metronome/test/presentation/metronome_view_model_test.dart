import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metronome/metronome.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<IMetronomeRepository>()])
import 'metronome_view_model_test.mocks.dart';

void main() {
  group('MetronomeViewModel', () {
    late MockIMetronomeRepository mockMetronomeRepository;
    late ProviderContainer container;

    setUp(() {
      mockMetronomeRepository = MockIMetronomeRepository();
      container = ProviderContainer(
        overrides: [
          metronomeRepositoryProvider.overrideWithValue(
            mockMetronomeRepository,
          ),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態が正しく設定される', () {
      final state = container.read(metronomeViewModelProvider);

      expect(state.bpm, 120);
      expect(state.isPlaying, false);
      expect(state.currentBeat, 1);
      expect(state.timeSignatureNumerator, 4);
      expect(state.timeSignatureDenominator, 4);
    });

    test('BPM変更が正常に動作する', () {
      final newBpm = 140;
      when(mockMetronomeRepository.changeBpm(newBpm)).thenAnswer((_) {
        final state = MetronomeState();
        return state.changeBpm(newBpm);
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      viewModel.changeBpm(newBpm);
      final state = container.read(metronomeViewModelProvider);

      expect(state.bpm, newBpm);
    });

    test('無効なBPMは変更されない', () {
      final newBpm = 20; // 無効なBPM
      when(
        mockMetronomeRepository.changeBpm(newBpm),
      ).thenReturn(MetronomeState()..changeBpm(newBpm));

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      viewModel.changeBpm(newBpm);
      final state = container.read(metronomeViewModelProvider);

      // 初期状態のBPMが維持されることを確認
      expect(state.bpm, 120);
    });

    test('メトロノーム開始が正常に動作する', () async {
      when(mockMetronomeRepository.playClick()).thenAnswer((_) {
        final state = MetronomeState();
        return state.start();
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      await viewModel.start();
      final state = container.read(metronomeViewModelProvider);

      expect(state.isPlaying, true);
    });

    test('メトロノーム停止が正常に動作する', () async {
      when(mockMetronomeRepository.playClick()).thenAnswer((_) {
        final state = MetronomeState();
        return state.start();
      });
      when(mockMetronomeRepository.stopClick()).thenAnswer((_) {
        final state = MetronomeState();
        return state.stop();
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      // 一度開始してから停止
      await viewModel.start();
      await viewModel.stop();
      final state = container.read(metronomeViewModelProvider);

      expect(state.isPlaying, false);
    });
  });
}
