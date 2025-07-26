import 'package:carousel_slider/carousel_slider.dart';
import 'package:chord_progression/chord_progression.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _fontSizeRate = 0.4;
const _disableChordAlpha = 128;

class ChordCarousel extends HookWidget {
  const ChordCarousel({
    required this.chords,
    required this.controller,
    super.key,
  });

  final List<Chord> chords;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    final centerIndex = useState(0);

    return IgnorePointer(
      child: CarouselSlider.builder(
        itemCount: chords.length,
        options: CarouselOptions(
          height: 100,
          viewportFraction: 0.4,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            centerIndex.value = index;
          },
        ),
        carouselController: controller,
        itemBuilder: (context, index, _) {
          final isCenter = centerIndex.value == index;
          final displayMediumFontSize = Theme.of(
            context,
          ).textTheme.displayMedium!.fontSize!;
          final fontSize = isCenter
              ? displayMediumFontSize
              : displayMediumFontSize * _fontSizeRate;
          final color = isCenter
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(
                  context,
                ).colorScheme.onSurface.withAlpha(_disableChordAlpha);
          final chord = chords[index];

          return Center(
            child: Text(
              chord.toString(),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: color,
                fontSize: fontSize,
              ),
            ),
          );
        },
      ),
    );
  }
}
