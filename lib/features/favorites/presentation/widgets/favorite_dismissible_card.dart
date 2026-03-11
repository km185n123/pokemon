import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/core/widgets/cards/pokemon_card.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class FavoriteDismissibleCard extends StatelessWidget {
  final Pokemon pokemon;

  const FavoriteDismissibleCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Dismissible(
      key: Key(pokemon.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<FavoriteCubit>().toggleFavorite(pokemon);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.favoritesRemovedSnackbar(pokemon.name))),
        );
      },
      background: _DeleteBackground(),
      child: PokemonCard(pokemon: pokemon, heroContext: 'favorites'),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Icon(Icons.delete, color: Colors.white, size: 32),
    );
  }
}
