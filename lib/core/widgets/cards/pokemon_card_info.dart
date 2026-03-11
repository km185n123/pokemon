import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/chips/pokemon_type_badge.dart';

class PokemonCardInfo extends StatelessWidget {
  final int id;
  final String name;
  final List<String> types;

  const PokemonCardInfo({
    super.key,
    required this.id,
    required this.name,
    required this.types,
  });

  String formatName() {
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nº${id.toString().padLeft(3, '0')}',
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            formatName(),
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(children: types.map((t) => PokemonTypeBadge(type: t)).toList()),
        ],
      ),
    );
  }
}
