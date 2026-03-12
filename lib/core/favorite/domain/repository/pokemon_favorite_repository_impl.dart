import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/error/failure.dart';

import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/services/pokemon_favorite_service.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/core/favorite/domain/repositories/pokemon_favorite_repository.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';

class PokemonFavoriteRepositoryImpl implements PokemonFavoriteRepository {
  final PokemonFavoriteService favoriteService;
  final PokemonLocalDataSource localDataSource;
  final CacheHandler cacheHandler;
  final ProfileRepository profileRepository;

  PokemonFavoriteRepositoryImpl(
    this.favoriteService,
    this.localDataSource,
    this.cacheHandler,
    this.profileRepository,
  );

  @override
  Future<Either<Failure, void>> addFavorite(Pokemon pokemon) {
    return favoriteService.addFavorite(pokemon);
  }

  @override
  Future<Either<Failure, void>> deleteFavorite(Pokemon pokemon) {
    return favoriteService.deleteFavorite(pokemon);
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getFavoritePokemons() {
    return favoriteService.getFavoritePokemons();
  }
}
