import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/add_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_favorite_pokemons.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final AddFavoritePokemon addFavoritePokemon;
  final DeleteFavoritePokemon deleteFavoritePokemon;
  final GetFavoritePokemons getFavoritePokemons;

  FavoriteCubit(
    this.addFavoritePokemon,
    this.deleteFavoritePokemon,
    this.getFavoritePokemons,
  ) : super(const FavoriteState(favorites: {}));

  Future<void> loadFavorites() async {
    final result = await getFavoritePokemons();
    result.fold(
      (failure) => null, // Ignore failures internally for now
      (pokemons) {
        final favoritesMap = {for (var p in pokemons) p.id: true};
        emit(state.copyWith(favorites: favoritesMap));
      },
    );
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    final currentFavorite = state.isFavorite(pokemon.id);

    final updatedFavorites = Map<int, bool>.from(state.favorites);

    updatedFavorites[pokemon.id] = !currentFavorite;

    emit(state.copyWith(favorites: updatedFavorites));

    final updatedPokemon = Pokemon(
      id: pokemon.id,
      name: pokemon.name,
      image: pokemon.image,
      types: pokemon.types,
      isFavorite: !currentFavorite,
    );

    if (!currentFavorite) {
      await addFavoritePokemon(updatedPokemon);
    } else {
      await deleteFavoritePokemon(updatedPokemon);
    }
  }
}
