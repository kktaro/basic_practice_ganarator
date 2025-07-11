import 'package:just_audio/just_audio.dart';
import 'package:core/core.dart';

/// MetronomeRepositoryの実装
class MetronomeRepositoryImpl implements MetronomeRepository {
  late final AudioPlayer _normalClickPlayer;
  late final AudioPlayer _accentClickPlayer;

  @override
  Future<void> initialize() async {
    _normalClickPlayer = AudioPlayer();
    _accentClickPlayer = AudioPlayer();

    // 通常のクリック音を設定
    await _normalClickPlayer.setAsset(
      'packages/metronome/assets/sound/click.mp3',
    );

    // アクセントクリック音も同じファイルを使用（将来的に異なる音に変更可能）
    await _accentClickPlayer.setAsset(
      'packages/metronome/assets/sound/click.mp3',
    );

    // プリロードして即座に再生できるようにする
    await _normalClickPlayer.load();
    await _accentClickPlayer.load();
  }

  @override
  Future<void> playClick({bool isAccent = false}) async {
    final player = isAccent ? _accentClickPlayer : _normalClickPlayer;
    
    // 再生位置を最初に戻してから再生
    await player.seek(Duration.zero);
    await player.play();
  }

  @override
  Future<void> setVolume(double volume) async {
    final clampedVolume = volume.clamp(0.0, 1.0);
    await _normalClickPlayer.setVolume(clampedVolume);
    await _accentClickPlayer.setVolume(clampedVolume);
  }

  @override
  Future<void> dispose() async {
    await _normalClickPlayer.dispose();
    await _accentClickPlayer.dispose();
  }
}