import 'package:flutter/material.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class Description extends StatelessWidget {
  final PokemonDetail detail;

  const Description({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      detail.description.isNotEmpty ? detail.description : l10n.noDescription,
      style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
    );
  }
}
