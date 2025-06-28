# プロジェクト基本情報

このプロジェクトはDartとFlutterを使用して開発する、以下のプラットフォームに対応したアプリケーションである。

- iOS
- Android
- MacOS

楽器の基礎練習を行うためのアプリケーションであり、ユーザが練習を行う際に必要となるBPMの設定やフレーズのコードを提供する。

## アプリ機能仕様

アプリケーションでは以下の機能を提供する。

- BPMの設定
- 指定したBPMでのカウント(クリック)音の再生
- フレーズに使用するコードの提供

# 言語設定

このリポジトリでの作業時は、すべてのやりとりを日本語で行うこと。

# アーキテクチャ設計

## アーキテクチャパターン

Clean Architecture + Riverpod + Repository Patternを採用する。

### レイヤー構成

- **Presentation Layer**: UI + Riverpod Provider
- **Domain Layer**: ビジネスロジック + Entity
- **Data Layer**: Repository実装 + Local Data Source

## 技術選定

### Core依存関係

- `flutter_riverpod`: 状態管理
- `just_audio`: 高精度音声再生（リアルタイム性重視）
- `google_mobile_ads`: 広告表示

### 開発支援

- `freezed`: データクラス生成
- `json_annotation`: JSON処理
- `riverpod_generator`: コード生成ツール

### プロジェクト構成

```
analysis_options.yaml
melos.yaml
pubspec.yaml
packages/
├──bass_app/
│   ├── pubspec.yaml
│   ├── android/
│   ├── ios/
│   ├── macos/
│   ├── test/
│   └── lib/
│       └── main.dart
├── core/
│   ├── lib/
│   ├── test/
│   └── pubspec.yaml
├── features/
│   ├── metronome/
│   └── chord_progression/
```

## 設計方針

- 完全オフライン動作（広告表示以外）
- リアルタイム音声処理を重視
- シンプルなコード進行生成
- マルチプラットフォーム対応

# コミットメッセージ規則

コミットメッセージは短く簡潔に記述すること。

# 開発ルール

- `pubspec.yaml`の更新を行った場合は必ず`dart run melos bs`を実行すること
- 自動生成ファイルは`lib/generated`に出力すること
