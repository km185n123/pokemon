import 'package:flutter/material.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/core/widgets/chips/pokemon_type_badge.dart';

class DetailTitleSection extends StatelessWidget {
  final Pokemon pokemon;

  const DetailTitleSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pokemon.name[0].toUpperCase() +
              pokemon.name.substring(1).toLowerCase(),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Nº${pokemon.id.toString().padLeft(3, '0')}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: pokemon.types
              .map((type) => PokemonTypeBadge(type: type))
              .toList(),
        ),
      ],
    );
  }
}
