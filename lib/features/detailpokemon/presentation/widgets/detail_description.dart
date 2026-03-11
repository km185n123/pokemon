import 'package:flutter/material.dart';

import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';

class DetailDescription extends StatelessWidget {
  final PokemonDetail detail;

  const DetailDescription({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Text(
      detail.description.isNotEmpty
          ? detail.description
          : 'No description available.',
      style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
    );
  }
}
