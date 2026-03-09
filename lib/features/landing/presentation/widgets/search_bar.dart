import 'package:pokemon/features/landing/presentation/widgets/pokemon_search_button.dart';
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
        PokemonSearchButton(onPressed: () {}),
      ],
    );
  }
}
