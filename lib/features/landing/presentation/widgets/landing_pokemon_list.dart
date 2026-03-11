import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/cards/pokemon_card.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:pokemon/features/landing/presentation/widgets/filter_results_header.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_loading_indicator.dart';

class LandingPokemonList extends StatelessWidget {
  final ScrollController scrollController;
  final PokemonsLoaded state;

  const LandingPokemonList({
    super.key,
    required this.scrollController,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: state.pokemons.length + (state.isLoadingMore ? 2 : 1),
      itemBuilder: (context, index) {
        if (index == 0) {
          if (state.selectedTypes.isNotEmpty) {
            return FilterResultsHeader(count: state.pokemons.length);
          }
          return const SizedBox.shrink();
        }

        if (index == state.pokemons.length + 1) {
          return const LandingLoadingIndicator();
        }

        final pokemon = state.pokemons[index - 1];
        return PokemonCard(pokemon: pokemon, heroContext: 'landing');
      },
    );
  }
}
