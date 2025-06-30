import 'package:core/core.dart';
import '../../domain/repositories/metronome_repository.dart';
import '../datasources/metronome_audio_datasource.dart';

class MetronomeRepositoryImpl implements MetronomeRepository {
  MetronomeRepositoryImpl(this._dataSource);

  final MetronomeAudioDataSource _dataSource;

  @override
  Stream<MetronomeState> get stateStream => _dataSource.stateStream;

  @override
  Future<void> start(BPM bpm) => _dataSource.start(bpm);

  @override
  Future<void> stop() => _dataSource.stop();

  @override
  Future<void> changeBpm(BPM bpm) => _dataSource.changeBpm(bpm);

  @override
  Future<void> changeVolume(double volume) => _dataSource.changeVolume(volume);

  @override
  Future<void> changeBeatsPerMeasure(int beats) =>
      _dataSource.changeBeatsPerMeasure(beats);

  @override
  Future<void> toggleAccent(bool accent) => _dataSource.toggleAccent(accent);

  @override
  void dispose() => _dataSource.dispose();
}
