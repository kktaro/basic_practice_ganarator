import 'package:freezed_annotation/freezed_annotation.dart';

part 'metronome_state.freezed.dart';

/// BPMの最小値
const int minBpm = 30;

/// BPMの最大値
const int maxBpm = 300;

/// メトロノームの状態を表すエンティティ
@freezed
abstract class MetronomeState with _$MetronomeState {

  const factory MetronomeState({
    @Default(120) int bpm,
    @Default(false) bool isPlaying,
    @Default(1) int currentBeat,

    /// 拍子の分子（例: 3/4拍子なら3）
    @Default(4) int timeSignatureNumerator,

    /// 拍子の分母（例: 3/4拍子なら4）
    @Default(4) int timeSignatureDenominator, // 拍子の分母
  }) = _MetronomeState;
  const MetronomeState._();

  /// BPMが有効な範囲内かチェック
  bool get isValidBpm => bpm >= minBpm && bpm <= maxBpm;

  /// 1拍の間隔（ミリ秒）
  int get beatIntervalMs => (60000 / bpm).round();

  /// 次の拍に進む
  MetronomeState nextBeat() {
    final nextBeatNumber = currentBeat >= timeSignatureNumerator
        ? 1
        : currentBeat + 1;
    return copyWith(currentBeat: nextBeatNumber);
  }

  /// メトロノーム開始
  MetronomeState start() => copyWith(isPlaying: true);

  /// メトロノーム停止
  MetronomeState stop() => copyWith(isPlaying: false, currentBeat: 1);

  /// BPM変更
  MetronomeState changeBpm(int newBpm) {
    if (newBpm < minBpm || newBpm > maxBpm) {
      return this; // 無効なBPMの場合は変更しない
    }
    return copyWith(bpm: newBpm);
  }
}
