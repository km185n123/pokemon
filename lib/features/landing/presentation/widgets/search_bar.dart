import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_bottom_sheet.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_search_by_filter_button.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_search_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PokemonSearchField(),
        const SizedBox(width: 12),
        PokemonSearchByFilterButton(
          onPressed: () {
            final bloc = context.read<PokemonsBloc>();
            final currentState = bloc.state;
            List<String> currentFilters = [];
            if (currentState is PokemonsLoaded) {
              currentFilters = currentState.selectedTypes;
            }

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) => FilterBottomSheet(
                initialSelectedTypes: currentFilters,
                onApply: (newFilters) {
                  bloc.add(PokemonsFilterChanged(newFilters));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
