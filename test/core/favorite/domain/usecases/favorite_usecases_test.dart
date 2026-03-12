import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/domain/repositories/pokemon_favorite_repository.dart';
import 'package:pokemon/core/favorite/domain/usecases/add_favorite_pokemon.dart';
import 'package:pokemon/core/favorite/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/core/favorite/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class MockPokemonFavoriteRepository extends Mock
    implements PokemonFavoriteRepository {}

void main() {
  late MockPokemonFavoriteRepository mockRepository;
  late AddFavoritePokemon addUseCase;
  late DeleteFavoritePokemon deleteUseCase;
  late GetFavoritePokemons getUseCase;

  setUpAll(() {
    registerFallbackValue(const Pokemon(id: 0, name: '', image: '', types: []));
  });

  setUp(() {
    mockRepository = MockPokemonFavoriteRepository();
    addUseCase = AddFavoritePokemon(mockRepository);
    deleteUseCase = DeleteFavoritePokemon(mockRepository);
    getUseCase = GetFavoritePokemons(mockRepository);
  });

  final tPokemon = const Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass'],
  );

  group('AddFavoritePokemon', () {
    test('should call repository.addFavorite with correct pokemon', () async {
      // Arrange
      when(
        () => mockRepository.addFavorite(any()),
      ).thenAnswer((_) async => const Right(null));

      // Act
      final result = await addUseCase(tPokemon);

      // Assert
      expect(result, const Right(null));
      verify(() => mockRepository.addFavorite(tPokemon)).called(1);
    });

    test('should return Left(Failure) when repository call fails', () async {
      // Arrange
      final tFailure = CacheFailure('error');
      when(
        () => mockRepository.addFavorite(any()),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await addUseCase(tPokemon);

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockRepository.addFavorite(tPokemon)).called(1);
    });
  });

  group('DeleteFavoritePokemon', () {
    test(
      'should call repository.deleteFavorite with correct pokemon',
      () async {
        // Arrange
        when(
          () => mockRepository.deleteFavorite(any()),
        ).thenAnswer((_) async => const Right(null));

        // Act
        final result = await deleteUseCase(tPokemon);

        // Assert
        expect(result, const Right(null));
        verify(() => mockRepository.deleteFavorite(tPokemon)).called(1);
      },
    );

    test('should return Left(Failure) when repository call fails', () async {
      // Arrange
      final tFailure = CacheFailure('error');
      when(
        () => mockRepository.deleteFavorite(any()),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await deleteUseCase(tPokemon);

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockRepository.deleteFavorite(tPokemon)).called(1);
    });
  });

  group('GetFavoritePokemons', () {
    final tPokemons = [tPokemon];

    test(
      'should return Right(List<Pokemon>) when call is successful',
      () async {
        // Arrange
        when(
          () => mockRepository.getFavoritePokemons(),
        ).thenAnswer((_) async => Right(tPokemons));

        // Act
        final result = await getUseCase();

        // Assert
        expect(result, Right(tPokemons));
        verify(() => mockRepository.getFavoritePokemons()).called(1);
      },
    );

    test('should return Left(Failure) when call fails', () async {
      // Arrange
      final tFailure = CacheFailure('error');
      when(
        () => mockRepository.getFavoritePokemons(),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await getUseCase();

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockRepository.getFavoritePokemons()).called(1);
    });
  });
}
