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
      _allPokemons = List.from(pokemons);
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
    final currentState = state;
    if (currentState is! PokemonsLoaded ||
        currentState.hasReachedMax ||
        currentState.isLoadingMore) {
      return;
    }

    emit(currentState.copyWith(isLoadingMore: true));
    _currentOffset += 5;

    final result = await getPokemons(_currentOffset);

    result.fold((failure) => emit(PokemonsError(failure)), (newPokemons) {
      if (newPokemons.isEmpty) {
        emit(currentState.copyWith(hasReachedMax: true, isLoadingMore: false));
      } else {
        _allPokemons.addAll(newPokemons);
        emit(PokemonsLoaded(_filteredPokemons, selectedTypes: _selectedTypes));
      }
    });
  }

  void _onSearch(PokemonsSearch event, Emitter<PokemonsState> emit) {
    if (state is! PokemonsLoaded) return;
    _currentQuery = event.query;
    emit((state as PokemonsLoaded).copyWith(pokemons: _filteredPokemons));
  }

  void _onFilterChanged(
    PokemonsFilterChanged event,
    Emitter<PokemonsState> emit,
  ) {
    if (state is! PokemonsLoaded) return;
    _selectedTypes = event.types;
    emit(
      (state as PokemonsLoaded).copyWith(
        pokemons: _filteredPokemons,
        selectedTypes: _selectedTypes,
      ),
    );
  }

  Future<void> _onRefreshFavorites(
    PokemonsRefreshFavorites event,
    Emitter<PokemonsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! PokemonsLoaded) return;

    final result = await getFavoritePokemons();
    result.fold((failure) => null, (favorites) {
      final favoriteIds = favorites.map((p) => p.id).toSet();

      _allPokemons = _allPokemons.map((pokemon) {
        final isFav = favoriteIds.contains(pokemon.id);
        return pokemon.copyWith(isFavorite: isFav);
      }).toList();

      emit(currentState.copyWith(pokemons: _filteredPokemons));
    });
  }
}
