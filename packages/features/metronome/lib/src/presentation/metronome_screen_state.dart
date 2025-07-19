import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metronome_screen_state.freezed.dart';

@freezed
abstract class MetronomeScreenState with _$MetronomeScreenState {
  const factory MetronomeScreenState({
    @Default(120) int bpm,
    @Default(false) bool isPlaying,
    @Default(1) int currentBeat,

    /// 拍子の分子（例: 3/4拍子なら3）
    @Default(4) int timeSignatureNumerator,

    /// 拍子の分母（例: 3/4拍子なら4）
    @Default(4) int timeSignatureDenominator, // 拍子の分母
  }) = _MetronomeScreenState;
  const MetronomeScreenState._();

  factory MetronomeScreenState.fromMetronome(MetronomeState metronomeState) =>
      MetronomeScreenState(
        bpm: metronomeState.bpm,
        isPlaying: metronomeState.isPlaying,
        currentBeat: metronomeState.currentBeat,
        timeSignatureNumerator: metronomeState.timeSignatureNumerator,
        timeSignatureDenominator: metronomeState.timeSignatureDenominator,
      );
}
