import 'package:core/core.dart';
import '../repositories/metronome_repository.dart';

class ChangeBpmUseCase {
  const ChangeBpmUseCase(this._repository);

  final MetronomeRepository _repository;

  Future<void> call(BPM bpm) => _repository.changeBpm(bpm);
}
