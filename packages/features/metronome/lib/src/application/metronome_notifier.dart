import 'package:core/core.dart';
import 'package:metronome/src/data/metronome_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metronome_notifier.g.dart';

@riverpod
class MetronomeNotifier extends _$MetronomeNotifier {
  @override
  Future<MetronomeState> build() async {
    // リポジトリの初期化
    await ref.read(metronomeRepositoryProvider).initialize();

    // リポジトリのdisposeを登録
    ref.onDispose(() async {
      await ref.read(metronomeRepositoryProvider).dispose();
    });

    return const MetronomeState();
  }

  void play() {
    if (state.value == null) return;
    state = AsyncData(ref.read(metronomeRepositoryProvider).playClick());
  }

  void stop() {
    if (state.value == null) return;
    state = AsyncData(ref.read(metronomeRepositoryProvider).stopClick());
  }

  void changeBpm(int newBpm) {
    if (state.value == null) return;
    state = AsyncData(ref.read(metronomeRepositoryProvider).changeBpm(newBpm));
  }
}
