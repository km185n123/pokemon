import 'package:flutter/material.dart';

class TitleSplash extends StatelessWidget {
  const TitleSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Poké-dex', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(
          'NINTENDO POKEMON',
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(letterSpacing: 2),
        ),
      ],
    );
  }
}
