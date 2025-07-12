import 'dart:async';
import 'package:metronome/src/presentation/metronome_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/metronome_repository_impl.dart';

part 'metronome_view_model.g.dart';

/// メトロノームのViewModel
@riverpod
class MetronomeViewModel extends _$MetronomeViewModel {
  @override
  MetronomeScreenState build() {
    final metronomeRepository = ref.read(metronomeRepositoryProvider);

    // ViewModelが破棄される時のクリーンアップ
    ref.onDispose(() {
      metronomeRepository.dispose();
    });

    // 初期化
    metronomeRepository.initialize();

    return MetronomeScreenState();
  }

  /// メトロノームを開始
  Future<void> start() async {
    final metronomeRepository = ref.read(metronomeRepositoryProvider);
    final newState = metronomeRepository.playClick();
    state = MetronomeScreenState.fromMetronome(newState);
  }

  /// メトロノームを停止
  Future<void> stop() async {
    final metronomeRepository = ref.read(metronomeRepositoryProvider);
    final newState = metronomeRepository.stopClick();
    state = MetronomeScreenState.fromMetronome(newState);
  }

  /// BPMを変更
  void changeBpm(int newBpm) {
    final metronomeRepository = ref.read(metronomeRepositoryProvider);
    final newState = metronomeRepository.changeBpm(newBpm);
    state = MetronomeScreenState.fromMetronome(newState);
  }
}
