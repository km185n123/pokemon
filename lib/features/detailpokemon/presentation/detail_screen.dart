import 'package:pokemon/features/detailpokemon/presentation/widgets/content_detail.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 24, bottom: 48),
              child: ContentDetail(pokemon: pokemon),
            ),
          ),
        ],
      ),
    );
  }
}
