import 'package:flutter/material.dart';

class BpmDisplayText extends StatelessWidget {
  const BpmDisplayText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
