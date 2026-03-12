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

  List<Pokemon> _allPokemons = [];
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

  List<Pokemon> get _filteredPokemons {
    return _allPokemons.where((pokemon) {
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
      _allPokemons = pokemons;
      emit(
        PokemonsLoaded(
          _filteredPokemons,
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
    if (state is PokemonsLoaded) {
      final currentState = state as PokemonsLoaded;
      if (currentState.hasReachedMax || currentState.isLoadingMore) return;

      emit(currentState.copyWith(isLoadingMore: true));
      _currentOffset += 5;

      final result = await getPokemons(_currentOffset);
      result.fold(
        (failure) {
          emit(PokemonsError(failure));
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
                _filteredPokemons,
                isLoadingMore: false,
                hasReachedMax: false,
                selectedTypes: _selectedTypes,
              ),
            );
          }
        },
      );
    }
  }

  void _onSearch(PokemonsSearch event, Emitter<PokemonsState> emit) {
    if (state is! PokemonsLoaded) return;
    _currentQuery = event.query;
    final currentState = state as PokemonsLoaded;

    emit(currentState.copyWith(pokemons: _filteredPokemons));
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
        pokemons: _filteredPokemons,
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
            _filteredPokemons,
            hasReachedMax: currentState.hasReachedMax,
            isLoadingMore: currentState.isLoadingMore,
            selectedTypes: _selectedTypes,
          ),
        );
      },
    );
  }
}
