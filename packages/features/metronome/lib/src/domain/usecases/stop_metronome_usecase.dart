import '../repositories/metronome_repository.dart';

class StopMetronomeUseCase {
  const StopMetronomeUseCase(this._repository);

  final MetronomeRepository _repository;

  Future<void> call() => _repository.stop();
}