import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metronome/metronome.dart';

class MetronomeControlArea extends ConsumerWidget {
  const MetronomeControlArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeProvider);
    final notifier = ref.read(metronomeProvider.notifier);

    return Center(
      child: metronomeState.when(
        data: (state) => IconButton(
          onPressed: () {
            if (state.isPlaying) {
              notifier.stop();
            } else {
              notifier.play();
            }
          },
          icon: Icon(
            state.isPlaying ? Icons.stop : Icons.play_arrow,
            size: 48,
          ),
        ),
        error: (error, stackTrace) => const IconButton(
          onPressed: null,
          icon: Icon(Icons.error, size: 48),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
