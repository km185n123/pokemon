import 'dart:async';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:pokemon/core/favorite/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemons getPokemons;
  final GetFavoritePokemons getFavoritePokemons;

  int _currentOffset = 0;
  List<String> _selectedTypes = [];
  String _currentQuery = '';

  PokemonsBloc({required this.getPokemons, required this.getFavoritePokemons})
    : super(PokemonsInitial()) {
    on<PokemonsStarted>(_onStarted);
    on<PokemonsLoadMore>(_onLoadMore);
    on<PokemonsSearch>(_onSearch);
    on<PokemonsFilterChanged>(_onFilterChanged);
    on<PokemonsRefreshFavorites>(_onRefreshFavorites);
  }

  List<Pokemon> _applyFilters(List<Pokemon> pokemons) {
    return pokemons.where((pokemon) {
      final matchesSearch =
          _currentQuery.isEmpty ||
          pokemon.name.toLowerCase().contains(_currentQuery.toLowerCase());

      final matchesTypes =
          _selectedTypes.isEmpty ||
          _selectedTypes.any((type) => pokemon.types.contains(type));

      return matchesSearch && matchesTypes;
    }).toList();
  }

  Future<void> _onStarted(
    PokemonsStarted event,
    Emitter<PokemonsState> emit,
  ) async {
    emit(PokemonsLoading());

    _currentOffset = 0;

    final result = await getPokemons(_currentOffset);

    result.fold((failure) => emit(PokemonsError(failure)), (pokemons) {
      emit(
        PokemonsLoaded(
          _applyFilters(pokemons),
          hasReachedMax: pokemons.isEmpty,
          selectedTypes: _selectedTypes,
        ),
      );
    });
  }

  Future<void> _onLoadMore(
    PokemonsLoadMore event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state is! PokemonsLoaded) return;

    final currentState = state as PokemonsLoaded;

    if (currentState.hasReachedMax || currentState.isLoadingMore) return;

    emit(currentState.copyWith(isLoadingMore: true));

    _currentOffset += 5;

    final result = await getPokemons(_currentOffset);

    result.fold((failure) => emit(PokemonsError(failure)), (pokemons) {
      if (pokemons.isEmpty) {
        emit(currentState.copyWith(hasReachedMax: true, isLoadingMore: false));
      } else {
        final updatedList = List<Pokemon>.from(currentState.pokemons)
          ..addAll(pokemons);

        emit(
          PokemonsLoaded(
            _applyFilters(updatedList),
            isLoadingMore: false,
            hasReachedMax: false,
            selectedTypes: _selectedTypes,
          ),
        );
      }
    });
  }

  void _onSearch(PokemonsSearch event, Emitter<PokemonsState> emit) {
    if (state is! PokemonsLoaded) return;

    _currentQuery = event.query;

    final currentState = state as PokemonsLoaded;

    emit(currentState.copyWith(pokemons: _applyFilters(currentState.pokemons)));
  }

  void _onFilterChanged(
    PokemonsFilterChanged event,
    Emitter<PokemonsState> emit,
  ) {
    if (state is! PokemonsLoaded) return;

    _selectedTypes = event.types;

    final currentState = state as PokemonsLoaded;

    emit(
      currentState.copyWith(
        pokemons: _applyFilters(currentState.pokemons),
        selectedTypes: _selectedTypes,
      ),
    );
  }

  Future<void> _onRefreshFavorites(
    PokemonsRefreshFavorites event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state is! PokemonsLoaded) return;

    final currentState = state as PokemonsLoaded;

    final result = await getFavoritePokemons();

    result.fold((_) {}, (favorites) {
      final favoriteIds = favorites.map((p) => p.id).toSet();

      final updated = currentState.pokemons.map((pokemon) {
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

      emit(currentState.copyWith(pokemons: _applyFilters(updated)));
    });
  }
}
