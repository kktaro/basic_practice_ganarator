import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:metronome/gen/assets.gen.dart';
import 'package:metronome/metronome.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metronome_repository_impl.g.dart';

@riverpod
class MetronomeRepository extends _$MetronomeRepository {
  @override
  IMetronomeRepository build() {
    return MetronomeRepositoryImpl(
      normalClickDataSource: JustAudioDataSourceImpl(),
      accentClickDataSource: JustAudioDataSourceImpl(),
    );
  }
}

/// MetronomeRepositoryの実装
class MetronomeRepositoryImpl implements IMetronomeRepository {
  late final AudioPlayerDataSource _normalClickDataSource;
  late final AudioPlayerDataSource _accentClickDataSource;

  MetronomeState _state = const MetronomeState();
  Timer? _metronomePlayer;

  MetronomeRepositoryImpl({
    required AudioPlayerDataSource normalClickDataSource,
    required AudioPlayerDataSource accentClickDataSource,
  }) : _normalClickDataSource = normalClickDataSource,
       _accentClickDataSource = accentClickDataSource;

  @override
  Future<void> initialize() async {
    // 通常のクリック音データソースを初期化
    await _normalClickDataSource.initializePlayer();
    await _normalClickDataSource.loadAsset(Assets.sound.click);

    // アクセントクリック音データソースを初期化
    await _accentClickDataSource.initializePlayer();
    //FIXME(kktaro): 通常のクリック音と異なるアセットを使用する
    await _accentClickDataSource.loadAsset(Assets.sound.click);
  }

  @override
  MetronomeState playClick() {
    if (_state.isPlaying) return _state;

    _state = _state.start();
    // TODO(kktaro): 博の頭をアクセントで再生できるようにする
    _metronomePlayer = Timer.periodic(
      Duration(milliseconds: _state.beatIntervalMs),
      (_) {
        debugPrint('onBeat! currentBeat: ${_state.currentBeat}');
        _state = _state.nextBeat();
        _normalClickDataSource.play();
      },
    );
    return _state;
  }

  @override
  MetronomeState stopClick() {
    if (!_state.isPlaying) return _state;
    _state = _state.stop();
    _metronomePlayer?.cancel();
    _metronomePlayer = null;
    return _state;
  }

  @override
  Future<void> dispose() async {
    await _normalClickDataSource.dispose();
    await _accentClickDataSource.dispose();
  }

  @override
  MetronomeState changeBpm(int newBpm) {
    _state = _state.changeBpm(newBpm);
    return _state;
  }
}
