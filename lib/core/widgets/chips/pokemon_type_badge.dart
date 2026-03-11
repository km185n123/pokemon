import 'package:flutter/material.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_color_utils.dart';

class PokemonTypeBadge extends StatelessWidget {
  final String type;

  const PokemonTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final color = PokemonColorUtils.getDarkerColorByType(type);
    final icon = PokemonColorUtils.getIconByType(type);

    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 4),
          Text(
            type[0].toUpperCase() + type.substring(1).toLowerCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
