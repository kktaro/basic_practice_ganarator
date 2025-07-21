import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice/src/widgets/bpm_slider.dart';

class PracticeScreen extends HookConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bpm = useState(120);

    return Scaffold(
      appBar: AppBar(title: const Text('Bass App')),
      body: BpmSlider(
        minValue: minBpm,
        maxValue: maxBpm,
        currentValue: bpm.value,
        onChanged: (value) {
          bpm.value = value;
        },
      ),
    );
  }
}
