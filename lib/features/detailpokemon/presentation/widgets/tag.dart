import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final bool isBlue;

  const Tag({required this.text, required this.isBlue, super.key});

  @override
  Widget build(BuildContext context) {
    // Determine colors based on isBlue flag
    final bgColor = isBlue
        ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
        : Theme.of(context).colorScheme.surfaceContainerHighest;
    final textColor = isBlue
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
