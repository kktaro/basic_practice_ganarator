import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:metronome/metronome.dart';

// Mock DataSource for testing
class MockMetronomeDataSource {
  final StreamController<MetronomeState> _stateController = StreamController<MetronomeState>.broadcast();
  MetronomeState _currentState = MetronomeState.initial();

  Stream<MetronomeState> get stateStream => _stateController.stream;

  Future<void> start(BPM bpm) async {
    _currentState = _currentState.copyWith(
      bpm: bpm,
      isPlaying: true,
    );
    _stateController.add(_currentState);
  }

  Future<void> stop() async {
    _currentState = _currentState.copyWith(isPlaying: false);
    _stateController.add(_currentState);
  }

  Future<void> changeBpm(BPM bpm) async {
    _currentState = _currentState.copyWith(bpm: bpm);
    _stateController.add(_currentState);
  }

  Future<void> changeVolume(double volume) async {
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

  void dispose() {
    _stateController.close();
  }
}

// Mock Repository for testing
class MockMetronomeRepository implements MetronomeRepository {
  MockMetronomeRepository(this._dataSource);

  final MockMetronomeDataSource _dataSource;

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
  Future<void> changeBeatsPerMeasure(int beats) => _dataSource.changeBeatsPerMeasure(beats);

  @override
  Future<void> toggleAccent(bool accent) => _dataSource.toggleAccent(accent);

  @override
  void dispose() => _dataSource.dispose();
}

void main() {
  group('MetronomeRepository', () {
    late MockMetronomeDataSource dataSource;
    late MockMetronomeRepository repository;

    setUp(() {
      dataSource = MockMetronomeDataSource();
      repository = MockMetronomeRepository(dataSource);
    });

    tearDown(() {
      repository.dispose();
    });

    test('should start metronome with given BPM', () async {
      final bpm = BPM.create(120);
      
      // State streamをlisten
      MetronomeState? capturedState;
      final subscription = repository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await repository.start(bpm);
      
      // 少し待ってから状態を確認
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.bpm.value, 120);
      expect(capturedState?.isPlaying, true);
      
      await subscription.cancel();
    });

    test('should stop metronome', () async {
      final bpm = BPM.create(120);
      
      MetronomeState? capturedState;
      final subscription = repository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await repository.start(bpm);
      await repository.stop();
      
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.isPlaying, false);
      
      await subscription.cancel();
    });

    test('should change BPM', () async {
      final initialBpm = BPM.create(120);
      final newBpm = BPM.create(140);
      
      MetronomeState? capturedState;
      final subscription = repository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await repository.start(initialBpm);
      await repository.changeBpm(newBpm);
      
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.bpm.value, 140);
      
      await subscription.cancel();
    });
  });

  group('UseCases', () {
    late MetronomeRepository mockRepository;
    late StartMetronomeUseCase startUseCase;
    late StopMetronomeUseCase stopUseCase;
    late ChangeBpmUseCase changeBpmUseCase;

    setUp(() {
      final dataSource = MockMetronomeDataSource();
      mockRepository = MockMetronomeRepository(dataSource);
      startUseCase = StartMetronomeUseCase(mockRepository);
      stopUseCase = StopMetronomeUseCase(mockRepository);
      changeBpmUseCase = ChangeBpmUseCase(mockRepository);
    });

    tearDown(() {
      mockRepository.dispose();
    });

    test('StartMetronomeUseCase should call repository start', () async {
      final bpm = BPM.create(120);
      
      MetronomeState? capturedState;
      final subscription = mockRepository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await startUseCase(bpm);
      
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.isPlaying, true);
      expect(capturedState?.bpm.value, 120);
      
      await subscription.cancel();
    });

    test('StopMetronomeUseCase should call repository stop', () async {
      final bpm = BPM.create(120);
      
      MetronomeState? capturedState;
      final subscription = mockRepository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await startUseCase(bpm);
      await stopUseCase();
      
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.isPlaying, false);
      
      await subscription.cancel();
    });

    test('ChangeBpmUseCase should call repository changeBpm', () async {
      final initialBpm = BPM.create(120);
      final newBpm = BPM.create(140);
      
      MetronomeState? capturedState;
      final subscription = mockRepository.stateStream.listen((state) {
        capturedState = state;
      });
      
      await startUseCase(initialBpm);
      await changeBpmUseCase(newBpm);
      
      await Future.delayed(Duration(milliseconds: 10));
      
      expect(capturedState?.bpm.value, 140);
      
      await subscription.cancel();
    });
  });
}
