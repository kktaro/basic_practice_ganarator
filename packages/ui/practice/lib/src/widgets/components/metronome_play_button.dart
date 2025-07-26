import 'package:flutter/material.dart';

class MetronomePlayButton extends StatelessWidget {
  const MetronomePlayButton({
    required this.isPlaying,
    required this.onPressed,
    super.key,
  });

  final bool isPlaying;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(16),
      ),
      child: Icon(
        isPlaying ? Icons.stop : Icons.play_arrow,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32,
      ),
    );
  }
}
