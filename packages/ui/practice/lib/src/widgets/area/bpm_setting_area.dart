import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:practice/src/widgets/components/bpm_change_button.dart';
import 'package:practice/src/widgets/components/bpm_display_text.dart';
import 'package:practice/src/widgets/components/bpm_slider.dart';

class BpmSettingArea extends StatelessWidget {
  const BpmSettingArea({
    required this.currentBpm,
    required this.onBpmChanged,
    super.key,
  });

  final int currentBpm;
  final ValueChanged<int> onBpmChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BpmDisplayText(text: currentBpm.toString()),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BpmChangeButton.decremental(
              onPressed: () => onBpmChanged(currentBpm - 1),
            ),
            const SizedBox(width: 16),
            BpmChangeButton.incremental(
              onPressed: () => onBpmChanged(currentBpm + 1),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BpmSlider(
          minValue: minBpm,
          maxValue: maxBpm,
          currentValue: currentBpm,
          onChanged: onBpmChanged,
        ),
      ],
    );
  }
}
