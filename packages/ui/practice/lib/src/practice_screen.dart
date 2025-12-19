import 'package:chord_progression/chord_progression.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metronome/metronome.dart';
import 'package:practice/src/widgets/area/bpm_setting_area.dart';
import 'package:practice/src/widgets/area/chord_area.dart';
import 'package:practice/src/widgets/area/metronome_control_area.dart';

class PracticeScreen extends HookConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeProvider);
    final notifier = ref.read(metronomeProvider.notifier);

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
          BpmSettingArea(
            currentBpm: metronomeState.asData?.value.bpm ?? 120,
            onBpmChanged: notifier.changeBpm,
          ),
          const SizedBox(height: 16),
          const MetronomeControlArea(),
        ],
      ),
    );
  }
}
