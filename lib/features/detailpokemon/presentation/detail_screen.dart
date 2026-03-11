import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_state.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/detail_header.dart';
import 'package:pokemon/features/detailpokemon/presentation/widgets/content_detail.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  final String heroContext;

  const DetailScreen({
    super.key,
    required this.pokemon,
    required this.heroContext,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PokemonDetailCubit>()..loadPokemonDetail(pokemon.id),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Contains the scrollable content including the white card overlaid on the header
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: DetailHeader(
                    pokemon: pokemon,
                    heroContext: heroContext,
                    onBack: () => context.pop(),
                  ),
                ),
                SliverToBoxAdapter(
                  // Negative translation to visually overlap the rounded white card over the header
                  child: Transform.translate(
                    offset: const Offset(0, -40),
                    child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
                      builder: (context, state) {
                        if (state is PokemonDetailLoading ||
                            state is PokemonDetailInitial) {
                          return Container(
                            height: 400,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is PokemonDetailLoaded) {
                          return ContentDetail(detail: state.pokemonDetail);
                        } else if (state is PokemonDetailError) {
                          return Container(
                            height: 400,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Error: ${state.message}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
