import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:metronome/metronome.dart';

void main() {
  group('MetronomeRepository', () {
    late MetronomeAudioDataSource dataSource;
    late MetronomeRepositoryImpl repository;

    setUp(() {
      dataSource = MetronomeAudioDataSource();
      repository = MetronomeRepositoryImpl(dataSource);
    });

    tearDown(() {
      repository.dispose();
    });

    test('should start metronome with given BPM', () async {
      final bpm = BPM.create(120);
      
      await repository.start(bpm);
      
      // State streamを確認
      final state = await repository.stateStream.first;
      expect(state.bpm.value, 120);
      expect(state.isPlaying, true);
    });

    test('should stop metronome', () async {
      final bpm = BPM.create(120);
      await repository.start(bpm);
      
      await repository.stop();
      
      final state = await repository.stateStream.first;
      expect(state.isPlaying, false);
    });

    test('should change BPM', () async {
      final initialBpm = BPM.create(120);
      final newBpm = BPM.create(140);
      
      await repository.start(initialBpm);
      await repository.changeBpm(newBpm);
      
      final state = await repository.stateStream.first;
      expect(state.bpm.value, 140);
    });
  });

  group('UseCases', () {
    late MetronomeRepository mockRepository;
    late StartMetronomeUseCase startUseCase;
    late StopMetronomeUseCase stopUseCase;
    late ChangeBpmUseCase changeBpmUseCase;

    setUp(() {
      final dataSource = MetronomeAudioDataSource();
      mockRepository = MetronomeRepositoryImpl(dataSource);
      startUseCase = StartMetronomeUseCase(mockRepository);
      stopUseCase = StopMetronomeUseCase(mockRepository);
      changeBpmUseCase = ChangeBpmUseCase(mockRepository);
    });

    tearDown(() {
      mockRepository.dispose();
    });

    test('StartMetronomeUseCase should call repository start', () async {
      final bpm = BPM.create(120);
      
      await startUseCase(bpm);
      
      final state = await mockRepository.stateStream.first;
      expect(state.isPlaying, true);
      expect(state.bpm.value, 120);
    });

    test('StopMetronomeUseCase should call repository stop', () async {
      final bpm = BPM.create(120);
      await startUseCase(bpm);
      
      await stopUseCase();
      
      final state = await mockRepository.stateStream.first;
      expect(state.isPlaying, false);
    });

    test('ChangeBpmUseCase should call repository changeBpm', () async {
      final initialBpm = BPM.create(120);
      final newBpm = BPM.create(140);
      
      await startUseCase(initialBpm);
      await changeBpmUseCase(newBpm);
      
      final state = await mockRepository.stateStream.first;
      expect(state.bpm.value, 140);
    });
  });
}
