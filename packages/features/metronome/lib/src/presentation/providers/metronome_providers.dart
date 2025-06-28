import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import '../../data/datasources/metronome_audio_datasource.dart';
import '../../data/repositories/metronome_repository_impl.dart';
import '../../domain/repositories/metronome_repository.dart';
import '../../domain/usecases/start_metronome_usecase.dart';
import '../../domain/usecases/stop_metronome_usecase.dart';
import '../../domain/usecases/change_bpm_usecase.dart';

part '../../../generated/presentation/providers/metronome_providers.g.dart';

// DataSource Provider
@riverpod
MetronomeAudioDataSource metronomeAudioDataSource(Ref ref) {
  final dataSource = MetronomeAudioDataSource();
  ref.onDispose(() => dataSource.dispose());
  return dataSource;
}

// Repository Provider
@riverpod
MetronomeRepository metronomeRepository(Ref ref) {
  final dataSource = ref.watch(metronomeAudioDataSourceProvider);
  return MetronomeRepositoryImpl(dataSource);
}

// UseCase Providers
@riverpod
StartMetronomeUseCase startMetronomeUseCase(Ref ref) {
  final repository = ref.watch(metronomeRepositoryProvider);
  return StartMetronomeUseCase(repository);
}

@riverpod
StopMetronomeUseCase stopMetronomeUseCase(Ref ref) {
  final repository = ref.watch(metronomeRepositoryProvider);
  return StopMetronomeUseCase(repository);
}

@riverpod
ChangeBpmUseCase changeBpmUseCase(Ref ref) {
  final repository = ref.watch(metronomeRepositoryProvider);
  return ChangeBpmUseCase(repository);
}

// State Provider
@riverpod
Stream<MetronomeState> metronomeState(Ref ref) {
  final repository = ref.watch(metronomeRepositoryProvider);
  return repository.stateStream;
}

// Controller Provider
@riverpod
MetronomeController metronomeController(Ref ref) {
  return MetronomeController(ref);
}

class MetronomeController {
  MetronomeController(this._ref);

  final Ref _ref;

  Future<void> start(BPM bpm) async {
    final useCase = _ref.read(startMetronomeUseCaseProvider);
    await useCase(bpm);
  }

  Future<void> stop() async {
    final useCase = _ref.read(stopMetronomeUseCaseProvider);
    await useCase();
  }

  Future<void> changeBpm(BPM bpm) async {
    final useCase = _ref.read(changeBpmUseCaseProvider);
    await useCase(bpm);
  }

  Future<void> changeVolume(double volume) async {
    final repository = _ref.read(metronomeRepositoryProvider);
    await repository.changeVolume(volume);
  }

  Future<void> togglePlayback() async {
    final state = _ref.read(metronomeStateProvider);

    await state.when(
      data: (metronomeState) async {
        if (metronomeState.isPlaying) {
          await stop();
        } else {
          await start(metronomeState.bpm);
        }
      },
      loading: () async {},
      error: (_, __) async {},
    );
  }
}
