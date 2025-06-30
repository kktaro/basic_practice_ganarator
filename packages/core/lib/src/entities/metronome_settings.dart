import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/bpm.dart';

part '../../generated/entities/metronome_settings.freezed.dart';

@freezed
class MetronomeSettings with _$MetronomeSettings {
  const factory MetronomeSettings({
    @Default(120) int defaultBpm,
    @Default(1.0) double defaultVolume,
    @Default(4) int defaultBeatsPerMeasure,
    @Default(true) bool defaultAccentFirstBeat,
  }) = _MetronomeSettings;

  const MetronomeSettings._();

  BPM get defaultBpmValue => BPM.create(defaultBpm);
}
