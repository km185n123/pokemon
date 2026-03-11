import 'dart:async';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:pokemon/features/landing/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemons getPokemons;
  final GetFavoritePokemons getFavoritePokemons;

  List<Pokemon> _allPokemons = [];
  int _currentOffset = 0;

  PokemonsBloc({required this.getPokemons, required this.getFavoritePokemons})
    : super(PokemonsInitial()) {
    on<PokemonsStarted>(_onStarted);
    on<PokemonsLoadMore>(_onLoadMore);
    on<PokemonsSearch>(_onSearch);
    on<PokemonsRefreshFavorites>(_onRefreshFavorites);
  }

  Future<void> _onStarted(
    PokemonsStarted event,
    Emitter<PokemonsState> emit,
  ) async {
    emit(PokemonsLoading());
    _currentOffset = 0;
    final result = await getPokemons(_currentOffset);
    result.fold((failure) => emit(PokemonsError(failure)), (pokemons) {
      _allPokemons = pokemons;
      emit(PokemonsLoaded(pokemons, hasReachedMax: pokemons.isEmpty));
    });
  }

  Future<void> _onLoadMore(
    PokemonsLoadMore event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state is PokemonsLoaded) {
      final currentState = state as PokemonsLoaded;
      if (currentState.hasReachedMax || currentState.isLoadingMore) return;

      emit(currentState.copyWith(isLoadingMore: true));
      _currentOffset += 5;

      final result = await getPokemons(_currentOffset);
      result.fold(
        (failure) {
          // You might want to handle error without losing current list,
          // but for simplicity, just remove loading indicator
          emit(currentState.copyWith(isLoadingMore: false));
        },
        (pokemons) {
          if (pokemons.isEmpty) {
            emit(
              currentState.copyWith(hasReachedMax: true, isLoadingMore: false),
            );
          } else {
            _allPokemons = List.of(_allPokemons)..addAll(pokemons);
            emit(
              PokemonsLoaded(
                _allPokemons,
                isLoadingMore: false,
                hasReachedMax: false,
              ),
            );
          }
        },
      );
    }
  }

  void _onSearch(PokemonsSearch event, Emitter<PokemonsState> emit) {
    if (state is! PokemonsLoaded) return;

    if (event.query.isEmpty) {
      emit(PokemonsLoaded(_allPokemons));
      return;
    }

    final filteredPokemons = _allPokemons
        .where(
          (pokemon) =>
              pokemon.name.toLowerCase().contains(event.query.toLowerCase()),
        )
        .toList();

    emit(PokemonsLoaded(filteredPokemons));
  }

  Future<void> _onRefreshFavorites(
    PokemonsRefreshFavorites event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state is! PokemonsLoaded) return;
    final currentState = state as PokemonsLoaded;

    final result = await getFavoritePokemons();
    result.fold(
      (failure) => null, // Ignore cache failures on silent refresh
      (favorites) {
        final favoriteIds = favorites.map((p) => p.id).toSet();

        _allPokemons = _allPokemons.map((pokemon) {
          final isFav = favoriteIds.contains(pokemon.id);
          if (pokemon.isFavorite != isFav) {
            return Pokemon(
              id: pokemon.id,
              name: pokemon.name,
              image: pokemon.image,
              types: pokemon.types,
              isFavorite: isFav,
            );
          }
          return pokemon;
        }).toList();

        // Re-emit either the full list or filtered if currently searching
        emit(
          PokemonsLoaded(
            _allPokemons,
            hasReachedMax: currentState.hasReachedMax,
            isLoadingMore: currentState.isLoadingMore,
          ),
        );
      },
    );
  }
}
