import 'package:core/core.dart';

/// メトロノーム機能のリポジトリインターフェース
abstract interface class IMetronomeRepository {
  /// 音声リソースを初期化する
  Future<void> initialize();

  /// クリック音を再生する
  ///
  /// @param state メトロノームの状態
  MetronomeState playClick();

  /// クリック音を停止する
  MetronomeState stopClick();

  /// BPMを変更する
  ///
  /// @param newBpm 新しいBPM値
  MetronomeState changeBpm(int newBpm);

  /// 音声リソースを解放する
  Future<void> dispose();
}
