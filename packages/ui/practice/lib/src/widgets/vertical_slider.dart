import 'package:flutter/material.dart';

class VerticalSlider extends StatelessWidget {
  const VerticalSlider({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.onChanged,
    super.key,
  });

  final int minValue;
  final int maxValue;
  final int currentValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Slider(
        value: currentValue.toDouble(),
        min: minValue.toDouble(),
        max: maxValue.toDouble(),
        onChanged: (value) {
          onChanged(value.toInt());
        },
        divisions: maxValue - minValue, // 刻みが1になるように設定
      ),
    );
  }
}
