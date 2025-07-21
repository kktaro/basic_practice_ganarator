import 'package:flutter/material.dart';

class BpmChangeButton extends StatelessWidget {
  const BpmChangeButton.incremental({
    required this.onPressed,
    super.key,
  }) : icon = Icons.add;

  const BpmChangeButton.decremental({
    required this.onPressed,
    super.key,
  }) : icon = Icons.remove;

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.secondary,
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
