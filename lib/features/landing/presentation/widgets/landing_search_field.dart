import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class LandingSearchField extends StatelessWidget {
  const LandingSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFE0E0E0);

    return Expanded(
      child: TextField(
        onChanged: (value) {
          context.read<PokemonsBloc>().add(PokemonsSearch(value));
        },
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.searchHint,
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: borderColor),
          ),
        ),
      ),
    );
  }
}
