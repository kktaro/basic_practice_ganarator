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

Clean Architecture + MVVM + Riverpod + Repository Patternを採用する。

### レイヤー構成

- **Presentation Layer**: View (UI) + ViewModel (Riverpod Provider) + State Class
- **Domain Layer**: Entity + Repository Interface
- **Data Layer**: Repository実装 + Data Source

### MVVM パターンの実現

RiverpodによるMVVMパターンの実装:

- **Model**: Entity (Domain Layer)
- **View**: Widget (Presentation Layer)
- **ViewModel**: Riverpod Provider (Presentation Layer)
- **State**: State Class (Presentation Layer)

#### ViewModel設計指針

- `@riverpod`アノテーションを使用してProviderを生成
- クラス名は`XxxViewModel`という命名規則に従う
- 状態管理と副作用（API通信、ローカル保存等）を担当
- UIから直接Repository操作は行わず、必ずViewModelを経由する

#### State Class設計指針

- ViewModelで管理する状態は必ずState Classを作成する
- クラス名は`XxxState`という命名規則に従う
- `@freezed`アノテーションを使用してイミュータブルなクラスとして定義
- 状態の変更は`copyWith`メソッドを通じて行う

### UseCaseレイヤーについて

**このプロジェクトの規模ではUseCaseレイヤーは不要とする。**

理由:
- 小規模アプリケーションのため、ビジネスロジックが複雑でない
- ViewModelから直接Repositoryを呼び出すことで十分
- 過度な抽象化を避け、シンプルな構成を維持

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
├── app/bass_app/
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
├── ui/
│   ├── practice/
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

## コード品質管理

### エラー対応方針

- **フォーマットエラー**: `melos run format`で自動修正
- **静的解析エラー**: すべて修正してからコミット
- **テスト失敗**: すべてのテストが成功するまで修正
- **警告（Warning）**: 原則として修正。やむを得ない場合は理由をコメントで明記

## PR作成ルール

### PRサイズ管理

- 1つのPRでの変更行数は**500行以下**を目安とする
- 500行を超える場合は以下の対応を行う：
  1. **機能を分割**してより小さなPRに分ける
  2. **サブイシューを作成**して段階的に実装する
  3. **実装順序を明確化**してレビュー負荷を軽減する

### サブイシュー作成ガイドライン

大きな機能実装時は以下の手順でサブイシューを作成する：

1. **メインイシュー**: 全体的な機能要件を記述
2. **サブイシュー**: 以下の単位で分割
   - データモデル定義
   - ビジネスロジック実装
   - UI実装
   - 統合・最終調整

#### サブイシューの命名規則

```
[メインイシュー番号] サブタスク: 具体的な実装内容
例: [#6] サブタスク: メトロノーム用データモデル定義
```

#### 実装順序の推奨

1. **Domain Layer**（Entity、Repository Interface）+ テスト
2. **Data Layer**（Repository実装、Data Source）+ テスト
3. **Presentation Layer**（Provider、UI）+ テスト
4. 統合・調整

**重要**: 各レイヤーの実装と同時にテストも作成し、都度テストを実行して品質を確保する
