import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/chips/pokemon_type_badge.dart';

import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';

class DetailWeaknessesSection extends StatelessWidget {
  final PokemonDetail detail;

  const DetailWeaknessesSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    if (detail.weaknesses.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Debilidades',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: detail.weaknesses
              .map((type) => PokemonTypeBadge(type: type))
              .toList(),
        ),
      ],
    );
  }
}
