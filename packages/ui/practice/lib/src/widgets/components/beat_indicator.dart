import 'package:flutter/material.dart';

class BeatIndicator extends StatelessWidget {
  const BeatIndicator({
    required this.maxBeats,
    required this.currentBeat,
    super.key,
  });

  final int currentBeat;
  final int maxBeats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(maxBeats, (index) {
          return _BeatLight(isActive: index + 1 <= currentBeat);
        }),
      ),
    );
  }
}

class _BeatLight extends StatelessWidget {
  const _BeatLight({
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Theme.of(context).colorScheme.primary : Colors.grey,
      ),
    );
  }
}
