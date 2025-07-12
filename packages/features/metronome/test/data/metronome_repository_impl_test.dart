import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metronome/metronome.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AudioPlayerDataSource>()])
import 'metronome_repository_impl_test.mocks.dart';

void main() {
  group('MetronomeRepositoryImpl', () {
    late MetronomeRepositoryImpl repository;
    final mockNormalDataSource = MockAudioPlayerDataSource();
    final mockAccentDataSource = MockAudioPlayerDataSource();

    setUp(() {
      repository = MetronomeRepositoryImpl(
        normalClickDataSource: mockNormalDataSource,
        accentClickDataSource: mockAccentDataSource,
      );
    });

    tearDown(() async {
      await repository.dispose();
    });

    test('初期化が正常に完了する', () async {
      await repository.initialize();

      verify(mockNormalDataSource.initializePlayer());
      verify(mockNormalDataSource.loadAsset(any));
      verify(mockAccentDataSource.initializePlayer());
      verify(mockAccentDataSource.loadAsset(any));
    });

    test('dispose が両方のデータソースで実行される', () async {
      await repository.initialize();
      await repository.dispose();

      verify(mockNormalDataSource.dispose());
      verify(mockAccentDataSource.dispose());
    });
  });
}
