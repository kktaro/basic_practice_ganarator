import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/bpm.dart';

part 'metronome_state.freezed.dart';

@freezed
class MetronomeState with _$MetronomeState {
  const factory MetronomeState({
    required BPM bpm,
    required bool isPlaying,
    @Default(1.0) double volume,
    @Default(4) int beatsPerMeasure,
    @Default(false) bool accentFirstBeat,
  }) = _MetronomeState;

  factory MetronomeState.initial() => MetronomeState(
        bpm: BPM.create(120),
        isPlaying: false,
      );
}