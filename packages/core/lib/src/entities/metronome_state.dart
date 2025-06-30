import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/entities/metronome_state.freezed.dart';

@freezed
abstract class MetronomeState with _$MetronomeState {
  factory MetronomeState({
    required BPM bpm,
    required bool isPlaying,
    @Default(1.0) double volume,
    @Default(4) int beatsPerMeasure,
    @Default(false) bool accentFirstBeat,
  }) = _MetronomeState;

  const MetronomeState._();

  factory MetronomeState.initial() =>
      MetronomeState(bpm: BPM.create(120), isPlaying: false);
}
