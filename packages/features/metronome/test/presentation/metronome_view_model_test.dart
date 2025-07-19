import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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

    Future<void> consumeInitialState() async {
      await container.read(metronomeViewModelProvider.future);
    }

    test('初期状態が正しく設定される', () async {
      final state = await container.read(metronomeViewModelProvider.future);

      await expectLater(state.bpm, 120);
      await expectLater(state.isPlaying, false);
      await expectLater(state.currentBeat, 1);
      await expectLater(state.timeSignatureNumerator, 4);
      await expectLater(state.timeSignatureDenominator, 4);
    });

    test('BPM変更が正常に動作する', () async {
      const newBpm = 140;
      when(mockMetronomeRepository.changeBpm(newBpm)).thenAnswer((_) {
        const state = MetronomeState();
        return state.changeBpm(newBpm);
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      await viewModel.changeBpm(newBpm);
      await consumeInitialState();
      final state = await container.read(metronomeViewModelProvider.future);

      await expectLater(state.bpm, newBpm);
    });

    test('無効なBPMは変更されない', () async {
      const newBpm = 20; // 無効なBPM
      when(
        mockMetronomeRepository.changeBpm(newBpm),
      ).thenReturn(const MetronomeState()..changeBpm(newBpm));

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      await viewModel.changeBpm(newBpm);
      await consumeInitialState();
      final state = await container.read(metronomeViewModelProvider.future);

      // 初期状態のBPMが維持されることを確認
      await expectLater(state.bpm, 120);
    });

    test('メトロノーム開始が正常に動作する', () async {
      when(mockMetronomeRepository.playClick()).thenAnswer((_) {
        const state = MetronomeState();
        return state.start();
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      await viewModel.start();
      await consumeInitialState();
      final state = await container.read(metronomeViewModelProvider.future);

      await expectLater(state.isPlaying, true);
    });

    test('メトロノーム停止が正常に動作する', () async {
      when(mockMetronomeRepository.playClick()).thenAnswer((_) {
        const state = MetronomeState();
        return state.start();
      });
      when(mockMetronomeRepository.stopClick()).thenAnswer((_) {
        const state = MetronomeState();
        return state.stop();
      });

      final viewModel = container.read(metronomeViewModelProvider.notifier);

      // 一度開始してから停止
      await viewModel.start();
      await viewModel.stop();

      await consumeInitialState();
      // 開始時のState
      await container.read(metronomeViewModelProvider.future);
      final state = await container.read(metronomeViewModelProvider.future);

      await expectLater(state.isPlaying, false);
    });
  });
}
