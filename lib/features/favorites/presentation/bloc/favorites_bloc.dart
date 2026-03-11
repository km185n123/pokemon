import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/landing/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_favorite_pokemons.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritePokemons getFavoritePokemons;
  final DeleteFavoritePokemon deleteFavoritePokemon;

  FavoritesBloc({
    required this.getFavoritePokemons,
    required this.deleteFavoritePokemon,
  }) : super(FavoritesInitial()) {
    on<FavoritesStarted>(_onStarted);
    on<FavoritesDeleted>(_onDeleted);
  }

  Future<void> _onStarted(
    FavoritesStarted event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesInitial) {
      emit(FavoritesLoading());
    }
    final result = await getFavoritePokemons();

    result.fold((failure) => emit(FavoritesError(failure)), (pokemons) {
      if (pokemons.isEmpty) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoritesLoaded(pokemons));
      }
    });
  }

  Future<void> _onDeleted(
    FavoritesDeleted event,
    Emitter<FavoritesState> emit,
  ) async {
    // Delete from db
    final result = await deleteFavoritePokemon(event.pokemon);

    // Refresh list if successful to show updated UI
    await result.fold(
      (failure) async =>
          emit(FavoritesError(failure)), // Error state if it fails
      (_) async => add(FavoritesStarted()), // Reload favorites
    );
  }
}
