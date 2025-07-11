import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'metronome_view_model.dart';

/// メトロノーム画面
class MetronomeScreen extends ConsumerWidget {
  const MetronomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(metronomeViewModelProvider);
    final viewModel = ref.read(metronomeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メトロノーム'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BPM表示
            Text(
              '${state.bpm}',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: state.isPlaying ? Colors.green : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'BPM',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 40),

            // 拍子表示
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(state.timeSignatureNumerator, (index) {
                final beatNumber = index + 1;
                final isCurrentBeat = state.currentBeat == beatNumber && state.isPlaying;
                
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrentBeat ? Colors.red : Colors.grey[300],
                    border: Border.all(
                      color: beatNumber == 1 ? Colors.red : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      beatNumber.toString(),
                      style: TextStyle(
                        color: isCurrentBeat ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),

            // BPM調整スライダー
            Row(
              children: [
                Text('${MetronomeState.minBpm}'),
                Expanded(
                  child: Slider(
                    value: state.bpm.toDouble(),
                    min: MetronomeState.minBpm.toDouble(),
                    max: MetronomeState.maxBpm.toDouble(),
                    divisions: MetronomeState.maxBpm - MetronomeState.minBpm,
                    onChanged: (value) {
                      viewModel.changeBpm(value.round());
                    },
                  ),
                ),
                Text('${MetronomeState.maxBpm}'),
              ],
            ),
            const SizedBox(height: 24),

            // BPM調整ボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => viewModel.changeBpm(state.bpm - 10),
                  child: const Text('-10'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.changeBpm(state.bpm - 1),
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.changeBpm(state.bpm + 1),
                  child: const Text('+1'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.changeBpm(state.bpm + 10),
                  child: const Text('+10'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // 再生/停止ボタン
            SizedBox(
              width: 120,
              height: 120,
              child: ElevatedButton(
                onPressed: () {
                  if (state.isPlaying) {
                    viewModel.stop();
                  } else {
                    viewModel.start();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: state.isPlaying ? Colors.red : Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Icon(
                  state.isPlaying ? Icons.stop : Icons.play_arrow,
                  size: 48,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}