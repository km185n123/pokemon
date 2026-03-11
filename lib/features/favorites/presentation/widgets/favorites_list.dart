import 'package:flutter/material.dart';
import 'package:pokemon/features/favorites/presentation/widgets/favorite_dismissible_card.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class FavoritesList extends StatelessWidget {
  final List<Pokemon> pokemons;

  const FavoritesList({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: pokemons.length,
      itemBuilder: (context, index) =>
          FavoriteDismissibleCard(pokemon: pokemons[index]),
    );
  }
}
