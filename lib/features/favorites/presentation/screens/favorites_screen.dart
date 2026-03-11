import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/core/widgets/feedback/empty_data_feedback.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late StreamSubscription<int> _tabSubscription;
  late FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    super.initState();
    _favoritesBloc = getIt<FavoritesBloc>()..add(FavoritesStarted());

    _tabSubscription = getIt<TabEventBus>().tabStream.listen((index) {
      if (index == 1 && mounted) {
        _favoritesBloc.add(FavoritesStarted());
      }
    });
  }

  @override
  void dispose() {
    _tabSubscription.cancel();
    _favoritesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _favoritesBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favoritos',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              // Si bien es un tab, ponemos un botón para dar la estética requerida
            },
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesError) {
              return Center(child: Text(state.failure.message));
            } else if (state is FavoritesEmpty) {
              return const Center(
                child: EmptyDataFeedback(
                  imageAsset: 'assets/images/fish_empty.png',
                  title: 'No has marcado ningún\nPokémon como favorito',
                  subtitle:
                      'Haz clic en el ícono de corazón de tus\nPokémon favoritos y aparecerán aquí.',
                ),
              );
            } else if (state is FavoritesLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = state.pokemons[index];
                  return Dismissible(
                    key: Key(pokemon.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<FavoritesBloc>().add(
                        FavoritesDeleted(pokemon),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${pokemon.name} eliminado de favoritos',
                          ),
                        ),
                      );
                    },
                    background: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    child: PokemonCard(
                      pokemon: pokemon,
                      onFavoriteToggled: () {
                        context.read<FavoritesBloc>().add(FavoritesStarted());
                      },
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
