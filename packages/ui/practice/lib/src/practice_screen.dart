import 'package:chord_progression/chord_progression.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice/src/widgets/area/bpm_setting_area.dart';
import 'package:practice/src/widgets/area/chord_area.dart';
import 'package:practice/src/widgets/area/metronome_area.dart';

class PracticeScreen extends HookConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bpm = useState(120);
    final isPlaying = useState(false);
    final currentBeat = useState(1);
    final chords = List<Chord>.generate(10000, (index) {
      final root = Note.values[index % Note.values.length];
      final type = ChordType.values[index % ChordType.values.length];
      return Chord(root: root, type: type);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Bass App')),
      body: Column(
        children: [
          ChordArea(
            chords: chords,
          ),
          const SizedBox(height: 16),
          MetronomeArea(
            isPlaying: isPlaying.value,
            currentBeat: currentBeat.value,
            onPlayPressed: () {
              isPlaying.value = !isPlaying.value;
              if (isPlaying.value) {
                // メトロノーム開始時の処理をここに追加可能
                currentBeat.value = 1;
              } else {
                // メトロノーム停止時の処理をここに追加可能
                currentBeat.value = 1;
              }
            },
          ),
          const SizedBox(height: 16),
          BpmSettingArea(
            currentBpm: bpm.value,
            onBpmChanged: (value) {
              bpm.value = value;
            },
          ),
        ],
      ),
    );
  }
}
