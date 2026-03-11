import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/chips/pokemon_type_badge.dart';

class DetailWeaknessesSection extends StatelessWidget {
  const DetailWeaknessesSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: const [
            // Mocked Weaknesses matching the design
            PokemonTypeBadge(type: 'fire'),
            PokemonTypeBadge(type: 'psychic'),
            PokemonTypeBadge(type: 'ice'),
            PokemonTypeBadge(type: 'flying'),
          ],
        ),
      ],
    );
  }
}
