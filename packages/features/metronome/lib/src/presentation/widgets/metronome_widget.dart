import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import '../providers/metronome_providers.dart';

class MetronomeWidget extends ConsumerWidget {
  const MetronomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeStateProvider);
    final controller = ref.read(metronomeControllerProvider);

    return metronomeState.when(
      data: (state) => _MetronomeContent(
        state: state,
        controller: controller,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('エラーが発生しました: $error'),
      ),
    );
  }
}

class _MetronomeContent extends StatelessWidget {
  const _MetronomeContent({
    required this.state,
    required this.controller,
  });

  final MetronomeState state;
  final MetronomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BPM表示
          Text(
            '${state.bpm.value}',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: state.isPlaying ? Colors.green : Colors.grey,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'BPM',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 32),

          // BPM調整スライダー
          Row(
            children: [
              IconButton(
                onPressed: () => _decrementBpm(),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Expanded(
                child: Slider(
                  value: state.bpm.value.toDouble(),
                  min: 30,
                  max: 300,
                  divisions: 270,
                  label: state.bpm.value.toString(),
                  onChanged: (value) => _changeBpm(value.round()),
                ),
              ),
              IconButton(
                onPressed: () => _incrementBpm(),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // 再生/停止ボタン
          FloatingActionButton.large(
            onPressed: controller.togglePlayback,
            backgroundColor: state.isPlaying ? Colors.red : Colors.green,
            child: Icon(
              state.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),

          // 音量調整
          Row(
            children: [
              const Icon(Icons.volume_down),
              Expanded(
                child: Slider(
                  value: state.volume,
                  min: 0.0,
                  max: 1.0,
                  onChanged: controller.changeVolume,
                ),
              ),
              const Icon(Icons.volume_up),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementBpm() {
    final newBpm = state.bpm.increment();
    controller.changeBpm(newBpm);
  }

  void _decrementBpm() {
    final newBpm = state.bpm.decrement();
    controller.changeBpm(newBpm);
  }

  void _changeBpm(int value) {
    try {
      final newBpm = BPM.create(value);
      controller.changeBpm(newBpm);
    } catch (e) {
      // BPMの範囲外の場合は何もしない
    }
  }
}