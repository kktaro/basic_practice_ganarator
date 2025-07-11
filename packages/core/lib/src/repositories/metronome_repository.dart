/// メトロノーム機能のリポジトリインターフェース
abstract class MetronomeRepository {
  /// クリック音を再生する
  /// 
  /// [isAccent] - アクセント拍（強拍）かどうか
  Future<void> playClick({bool isAccent = false});

  /// 音声リソースを初期化する
  Future<void> initialize();

  /// 音声リソースを解放する
  Future<void> dispose();

  /// ボリュームを設定する（0.0 - 1.0）
  Future<void> setVolume(double volume);
}