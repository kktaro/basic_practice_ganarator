import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:core/core.dart';
import '../data/metronome_repository_impl.dart';

part 'metronome_view_model.g.dart';

/// メトロノームのViewModel
@riverpod
class MetronomeViewModel extends _$MetronomeViewModel {
  late final MetronomeRepository _repository;
  Timer? _metronomeTimer;

  @override
  MetronomeState build() {
    _repository = MetronomeRepositoryImpl();
    
    // ViewModelが破棄される時のクリーンアップ
    ref.onDispose(() {
      _stopTimer();
      _repository.dispose();
    });

    // 初期化
    _repository.initialize();

    return const MetronomeState();
  }

  /// メトロノームを開始
  Future<void> start() async {
    if (state.isPlaying) return;

    state = state.start();
    _startTimer();
  }

  /// メトロノームを停止
  Future<void> stop() async {
    if (!state.isPlaying) return;

    state = state.stop();
    _stopTimer();
  }

  /// BPMを変更
  void changeBpm(int newBpm) {
    final newState = state.changeBpm(newBpm);
    if (newState != state) {
      state = newState;
      
      // 再生中の場合はタイマーを再開
      if (state.isPlaying) {
        _stopTimer();
        _startTimer();
      }
    }
  }

  /// ボリュームを変更
  Future<void> setVolume(double volume) async {
    await _repository.setVolume(volume);
  }

  /// タイマーを開始
  void _startTimer() {
    _stopTimer(); // 既存のタイマーがあれば停止

    final interval = Duration(milliseconds: state.beatIntervalMs);
    
    _metronomeTimer = Timer.periodic(interval, (timer) {
      _playClick();
      state = state.nextBeat();
    });

    // 最初のクリックを即座に再生
    _playClick();
  }

  /// タイマーを停止
  void _stopTimer() {
    _metronomeTimer?.cancel();
    _metronomeTimer = null;
  }

  /// クリック音を再生
  void _playClick() {
    final isAccent = state.currentBeat == 1; // 第1拍をアクセント
    _repository.playClick(isAccent: isAccent);
  }
}