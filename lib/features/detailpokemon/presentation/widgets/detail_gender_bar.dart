import 'package:flutter/material.dart';

import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';

class DetailGenderBar extends StatelessWidget {
  final PokemonDetail detail;

  const DetailGenderBar({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    // If the pokemon is genderless:
    if (detail.malePercentage == 0 && detail.femalePercentage == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'GENERO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Sin género',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'GENERO',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.pinkAccent, // Female base color
          ),
          child: Row(
            children: [
              if (detail.malePercentage > 0)
                Expanded(
                  flex: detail.malePercentage.toInt(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(4),
                        bottomLeft: const Radius.circular(4),
                        topRight: Radius.circular(
                          detail.femalePercentage == 0 ? 4 : 0,
                        ),
                        bottomRight: Radius.circular(
                          detail.femalePercentage == 0 ? 4 : 0,
                        ),
                      ),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              if (detail.femalePercentage > 0)
                Expanded(
                  flex: detail.femalePercentage.toInt(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(4),
                        bottomRight: const Radius.circular(4),
                        topLeft: Radius.circular(
                          detail.malePercentage == 0 ? 4 : 0,
                        ),
                        bottomLeft: Radius.circular(
                          detail.malePercentage == 0 ? 4 : 0,
                        ),
                      ),
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.male, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  '${detail.malePercentage.toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.female, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  '${detail.femalePercentage.toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
