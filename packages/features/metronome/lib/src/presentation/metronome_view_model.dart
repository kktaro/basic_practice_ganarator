import 'dart:async';

import 'package:metronome/src/data/metronome_repository_impl.dart';
import 'package:metronome/src/presentation/metronome_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metronome_view_model.g.dart';

/// メトロノームのViewModel
@riverpod
class MetronomeViewModel extends _$MetronomeViewModel {
  @override
  Future<MetronomeScreenState> build() async {
    final metronomeRepository = ref.read(metronomeRepositoryProvider);

    // ViewModelが破棄される時のクリーンアップ
    ref.onDispose(metronomeRepository.dispose);

    // 初期化
    await metronomeRepository.initialize();

    return const MetronomeScreenState();
  }

  /// メトロノームを開始
  Future<void> start() async {
    state = await AsyncValue.guard(() async {
      final metronomeRepository = ref.read(metronomeRepositoryProvider);
      final newState = metronomeRepository.playClick();
      return MetronomeScreenState.fromMetronome(newState);
    });
  }

  /// メトロノームを停止
  Future<void> stop() async {
    state = await AsyncValue.guard(() async {
      final metronomeRepository = ref.read(metronomeRepositoryProvider);
      final newState = metronomeRepository.stopClick();
      return MetronomeScreenState.fromMetronome(newState);
    });
  }

  /// BPMを変更
  Future<void> changeBpm(int newBpm) async {
    state = await AsyncValue.guard(() async {
      final metronomeRepository = ref.read(metronomeRepositoryProvider);
      final newState = metronomeRepository.changeBpm(newBpm);
      return MetronomeScreenState.fromMetronome(newState);
    });
  }
}
