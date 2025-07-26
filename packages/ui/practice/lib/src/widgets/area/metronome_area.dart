import 'package:flutter/material.dart';
import 'package:practice/src/widgets/components/beat_indicator.dart';
import 'package:practice/src/widgets/components/metronome_play_button.dart';

class MetronomeArea extends StatelessWidget {
  const MetronomeArea({
    required this.isPlaying,
    required this.currentBeat,
    required this.onPlayPressed,
    super.key,
  });

  final bool isPlaying;
  final int currentBeat;
  final VoidCallback onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BeatIndicator(currentBeat: currentBeat),
        const SizedBox(height: 16),
        MetronomePlayButton(
          isPlaying: isPlaying,
          onPressed: onPlayPressed,
        ),
      ],
    );
  }
}
