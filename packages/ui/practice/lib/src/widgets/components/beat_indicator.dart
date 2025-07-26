import 'package:flutter/material.dart';

class BeatIndicator extends StatelessWidget {
  const BeatIndicator({
    required this.currentBeat,
    super.key,
  });

  final int currentBeat;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentBeat.toString(),
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
