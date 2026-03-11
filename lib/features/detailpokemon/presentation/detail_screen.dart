import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_header.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/content_detail.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Contains the scrollable content including the white card overlaid on the header
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: DetailHeader(
                  pokemon: pokemon,
                  onBack: () => context.pop(),
                ),
              ),
              SliverToBoxAdapter(
                // Negative translation to visually overlap the rounded white card over the header
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: ContentDetail(pokemon: pokemon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
