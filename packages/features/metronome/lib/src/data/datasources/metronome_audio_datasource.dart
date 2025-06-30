import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:core/core.dart';
import 'package:metronome/gen/assets.gen.dart';

class MetronomeAudioDataSource {
  MetronomeAudioDataSource() : _audioPlayer = AudioPlayer();

  final AudioPlayer _audioPlayer;
  Timer? _timer;
  final StreamController<MetronomeState> _stateController =
      StreamController<MetronomeState>.broadcast();
  MetronomeState _currentState = MetronomeState.initial();

  Stream<MetronomeState> get stateStream => _stateController.stream;

  Future<void> initialize() async {
    await _audioPlayer.setAsset(Assets.sound.click);
  }

  Future<void> start(BPM bpm) async {
    if (_timer?.isActive == true) {
      await stop();
    }

    _currentState = _currentState.copyWith(bpm: bpm, isPlaying: true);
    _stateController.add(_currentState);

    final intervalMs = (60000 / bpm.value).round();
    _timer = Timer.periodic(Duration(milliseconds: intervalMs), (_) {
      _playClick();
    });
  }

  Future<void> stop() async {
    _timer?.cancel();
    _timer = null;

    _currentState = _currentState.copyWith(isPlaying: false);
    _stateController.add(_currentState);
  }

  Future<void> changeBpm(BPM bpm) async {
    _currentState = _currentState.copyWith(bpm: bpm);
    _stateController.add(_currentState);

    if (_currentState.isPlaying) {
      await start(bpm);
    }
  }

  Future<void> changeVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
    _currentState = _currentState.copyWith(volume: volume);
    _stateController.add(_currentState);
  }

  Future<void> changeBeatsPerMeasure(int beats) async {
    _currentState = _currentState.copyWith(beatsPerMeasure: beats);
    _stateController.add(_currentState);
  }

  Future<void> toggleAccent(bool accent) async {
    _currentState = _currentState.copyWith(accentFirstBeat: accent);
    _stateController.add(_currentState);
  }

  Future<void> _playClick() async {
    try {
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      // エラーハンドリング
    }
  }

  void dispose() {
    _timer?.cancel();
    _stateController.close();
    _audioPlayer.dispose();
  }
}
