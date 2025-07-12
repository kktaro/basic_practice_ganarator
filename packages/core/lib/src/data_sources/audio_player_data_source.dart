/// 音声再生のデータソースインターフェース
abstract interface class AudioPlayerDataSource {
  /// プレイヤーを初期化する
  Future<void> initializePlayer();

  /// 音声アセットを読み込む
  ///
  /// [assetPath] - アセットファイルのパス
  Future<void> loadAsset(String assetPath);

  /// 音声を再生する
  Future<void> play();

  /// プレイヤーのリソースを解放する
  Future<void> dispose();
}
