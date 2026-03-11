import 'package:flutter/material.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_title_section.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_description.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_stats_grid.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_gender_bar.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_weaknesses_section.dart';

class ContentDetail extends StatelessWidget {
  final Pokemon pokemon;

  const ContentDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailTitleSection(pokemon: pokemon),
            const SizedBox(height: 24),
            const DetailDescription(),
            const SizedBox(height: 24),
            const DetailStatsGrid(),
            const SizedBox(height: 24),
            const DetailGenderBar(),
            const SizedBox(height: 24),
            const DetailWeaknessesSection(),
            // Adding extra bottom padding for scrolling
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
