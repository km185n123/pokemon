import 'package:flutter/material.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/stat_card.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class DetailStatsGridSection extends StatelessWidget {
  final PokemonDetail detail;

  const DetailStatsGridSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.monitor_weight_outlined,
                title: l10n.statWeight,
                value: '${detail.weight.toStringAsFixed(1)} kg',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: StatCard(
                icon: Icons.height,
                title: l10n.statHeight,
                value: '${detail.height.toStringAsFixed(1)} m',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.category_outlined,
                title: l10n.statCategory,
                value: detail.category.toUpperCase(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: StatCard(
                icon: Icons.offline_bolt_outlined,
                title: l10n.statAbility,
                value: detail.ability.toUpperCase(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
