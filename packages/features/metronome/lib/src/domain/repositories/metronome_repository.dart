import 'package:core/core.dart';

abstract class MetronomeRepository {
  Stream<MetronomeState> get stateStream;
  Future<void> start(BPM bpm);
  Future<void> stop();
  Future<void> changeBpm(BPM bpm);
  Future<void> changeVolume(double volume);
  Future<void> changeBeatsPerMeasure(int beats);
  Future<void> toggleAccent(bool accent);
  void dispose();
}
