import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  final Pokemon pokemon;

  const ContentDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const SizedBox(height: 24)],
      ),
    );
  }
}
