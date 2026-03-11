import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_bottom_sheet.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_filter_button.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_search_field.dart';

class LandingSearchHeader extends StatelessWidget {
  const LandingSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const LandingSearchField(),
          const SizedBox(width: 12),
          LandingFilterButton(
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
      ),
    );
  }
}
