import 'package:pokemon/core/base/base_repository.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:fpdart/fpdart.dart';

class PokemonRepositoryImpl extends BaseRepository
    implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons([int offset = 0]) async {
    return performRequest<List<Pokemon>>(() async {
      final list = await remoteDataSource.getPokemons(offset);

      final futures = list.results.map(
        (e) => remoteDataSource.getPokemonDetail(e.url),
      );

      final details = await Future.wait(futures);

      return details.map((e) {
        return Pokemon(
          id: e.id,
          name: e.name,
          image:
              e.sprites.other?.officialArtwork?.frontDefault ??
              e.sprites.frontDefault ??
              '',
          types: e.types.map((t) => t.type.name).toList(),
        );
      }).toList();
    });
  }
}
