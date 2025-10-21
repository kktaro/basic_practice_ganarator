import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:metronome/metronome.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AudioPlayer>()])
import 'just_audio_data_source_impl_test.mocks.dart';

void main() async {
  late JustAudioDataSourceImpl dataSource;
  late AudioPlayer mockAudioPlayer;

  group('JustAudioDataSourceImpl-Initialize', () {
    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      dataSource = JustAudioDataSourceImpl();
    });

    tearDown(() async {
      // 初期化されていない場合はdisposeをスキップ
      try {
        await dataSource.dispose();
      } on Exception catch (_) {
        // 初期化されていない場合の例外は無視
      }
    });

    test('初期化が正常に完了する', () async {
      await dataSource.initializePlayerForTest(mockAudioPlayer);

      // プレイヤーが初期化されることを確認（例外が発生しない）
      expect(dataSource, isA<JustAudioDataSourceImpl>());
    });
  });

  group('JustAudioDataSourceImpl-Methods', () {
    setUp(() async {
      mockAudioPlayer = MockAudioPlayer();
      dataSource = JustAudioDataSourceImpl();
      await dataSource.initializePlayerForTest(mockAudioPlayer);
    });
    tearDown(() async {
      await dataSource.dispose();
    });

    test('loadAssetが正常に動作する', () async {
      const assetPath = 'assets/sample.mp3';

      await dataSource.loadAsset(assetPath);

      verify(mockAudioPlayer.setAsset(assetPath)).called(1);
      verify(mockAudioPlayer.load()).called(1);
    });

    test('playが正常に動作する', () async {
      await dataSource.play();
      verify(mockAudioPlayer.play()).called(1);
    });
  });
}
