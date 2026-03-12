import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/data/dao/pokemon_favorite_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/landing/data/services/pokemon_remote_service.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';

class MockPokemonRemoteService extends Mock implements PokemonRemoteService {}

class MockPokemonFavoriteLocalDataSource extends Mock
    implements PokemonFavoriteLocalDataSource {}

class MockPokemonLocalDataSource extends Mock
    implements PokemonLocalDataSource {}

class MockCacheHandler extends Mock implements CacheHandler {}

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonRemoteService mockRemoteService;
  late MockPokemonFavoriteLocalDataSource mockFavoriteService;
  late MockPokemonLocalDataSource mockLocalDataSource;
  late MockCacheHandler mockCacheHandler;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockRemoteService = MockPokemonRemoteService();
    mockFavoriteService = MockPokemonFavoriteLocalDataSource();
    mockLocalDataSource = MockPokemonLocalDataSource();
    mockCacheHandler = MockCacheHandler();
    mockProfileRepository = MockProfileRepository();

    repository = PokemonRepositoryImpl(
      mockRemoteService,
      mockFavoriteService,
      mockLocalDataSource,
      mockCacheHandler,
      mockProfileRepository,
    );
  });

  final tPokemon = const Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass'],
    isFavorite: false,
  );

  group('getPokemons', () {
    /*test('should return Right(List<Pokemon>) from cacheHandler', () async {
      // Arrange
      when(
        () => mockProfileRepository.getOfflineDbEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => mockCacheHandler.run<List<Pokemon>>(
          remote: any(named: 'remote'),
          saveCache: any(named: 'saveCache'),
          readCache: any(named: 'readCache'),
          returnCacheOnError: any(named: 'returnCacheOnError'),
          skipCache: any(named: 'skipCache'),
        ),
      ).thenAnswer((_) async => Right([tPokemon]));

      // Act
      final result = await repository.getPokemons(0);

      // Assert
      expect(result, Right([tPokemon]));
      verify(() => mockProfileRepository.getOfflineDbEnabled()).called(1);
      verify(
        () => mockCacheHandler.run<List<Pokemon>>(
          remote: any(named: 'remote'),
          saveCache: any(named: 'saveCache'),
          readCache: any(named: 'readCache'),
          returnCacheOnError: true,
          skipCache: false,
        ),
      ).called(1);
    });*/

    test('should propagate failure from cacheHandler', () async {
      // Arrange
      final tFailure = ServerFailure('error');
      when(
        () => mockProfileRepository.getOfflineDbEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => mockCacheHandler.run<List<Pokemon>>(
          remote: any(named: 'remote'),
          saveCache: any(named: 'saveCache'),
          readCache: any(named: 'readCache'),
          returnCacheOnError: any(named: 'returnCacheOnError'),
          skipCache: any(named: 'skipCache'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await repository.getPokemons(0);

      // Assert
      expect(result, Left(tFailure));
    });
  });

  group('getPokemonDetail', () {
    final tId = 1;
    final tDetailDto = const PokemonDetailDto(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      types: [],
      sprites: SpritesDto(),
      abilities: [],
    );
    final tSpeciesDto = const PokemonSpeciesDto(
      flavorTextEntries: [],
      genera: [],
      genderRate: 1,
    );

    test('should return Right(PokemonDetail) when successful', () async {
      // Arrange
      when(
        () => mockRemoteService.fetchPokemonDetail(any()),
      ).thenReturn(TaskEither.of((tDetailDto, tSpeciesDto)));

      // Act
      final result = await repository.getPokemonDetail(tId);

      // Assert
      expect(result.isRight(), true);
      verify(() => mockRemoteService.fetchPokemonDetail(tId)).called(1);
    });

    test('should return Left(Failure) when remote call fails', () async {
      // Arrange
      final tFailure = ServerFailure('error');
      when(
        () => mockRemoteService.fetchPokemonDetail(any()),
      ).thenReturn(TaskEither.left(tFailure));

      // Act
      final result = await repository.getPokemonDetail(tId);

      // Assert
      expect(result, Left(tFailure));
    });
  });
}
