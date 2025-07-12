import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:core/core.dart';

/// just_audioライブラリを使用したAudioPlayerDataSourceの実装
class JustAudioDataSourceImpl implements AudioPlayerDataSource {
  late final AudioPlayer _player;

  @override
  Future<void> initializePlayer() async {
    _player = AudioPlayer();
  }

  @visibleForTesting
  Future<void> initializePlayerForTest(AudioPlayer audioPlayer) async {
    _player = audioPlayer;
  }

  @override
  Future<void> loadAsset(String assetPath) async {
    await _player.setAsset(assetPath);
    // プリロードして即座に再生できるようにする
    await _player.load();
  }

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }
}
