import 'package:core/core.dart';
import '../repositories/metronome_repository.dart';

class StartMetronomeUseCase {
  const StartMetronomeUseCase(this._repository);

  final MetronomeRepository _repository;

  Future<void> call(BPM bpm) => _repository.start(bpm);
}