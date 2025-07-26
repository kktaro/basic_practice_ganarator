import 'package:carousel_slider/carousel_slider.dart';
import 'package:chord_progression/chord_progression.dart';
import 'package:flutter/material.dart';
import 'package:practice/src/widgets/components/chord_carousel.dart';

class ChordArea extends StatelessWidget {
  const ChordArea({
    required this.chords,
    super.key,
  });

  final List<Chord> chords;

  @override
  Widget build(BuildContext context) {
    final controller = CarouselSliderController();

    return ChordCarousel(
      chords: chords,
      controller: controller,
    );
  }
}
