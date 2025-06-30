import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';

void main() {
  group('BPM', () {
    test('should create valid BPM within range', () {
      expect(() => BPM.create(30), returnsNormally);
      expect(() => BPM.create(120), returnsNormally);
      expect(() => BPM.create(300), returnsNormally);
    });

    test('should throw error for BPM outside range', () {
      expect(() => BPM.create(29), throwsArgumentError);
      expect(() => BPM.create(301), throwsArgumentError);
    });

    test('should increment and decrement correctly', () {
      final bpm = BPM.create(120);

      final incremented = bpm.increment();
      expect(incremented.value, 121);

      final decremented = bpm.decrement();
      expect(decremented.value, 119);
    });

    test('should clamp at boundaries', () {
      final minBpm = BPM.create(30);
      final maxBpm = BPM.create(300);

      expect(minBpm.decrement().value, 30);
      expect(maxBpm.increment().value, 300);
    });
  });

  group('MetronomeState', () {
    test('should create initial state correctly', () {
      final state = MetronomeState.initial();

      expect(state.bpm.value, 120);
      expect(state.isPlaying, false);
      expect(state.volume, 1.0);
      expect(state.beatsPerMeasure, 4);
      expect(state.accentFirstBeat, false);
    });

    test('should copy with new values', () {
      final initialState = MetronomeState.initial();
      final newBpm = BPM.create(140);

      final newState = initialState.copyWith(bpm: newBpm, isPlaying: true);

      expect(newState.bpm.value, 140);
      expect(newState.isPlaying, true);
      expect(newState.volume, 1.0); // unchanged
    });
  });
}
