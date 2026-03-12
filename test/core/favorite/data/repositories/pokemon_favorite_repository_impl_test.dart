import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/data/dao/pokemon_favorite_local_data_source.dart';
import 'package:pokemon/core/favorite/data/repositories/pokemon_favorite_repository_impl.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class MockPokemonFavoriteLocalDataSource extends Mock
    implements PokemonFavoriteLocalDataSource {}

void main() {
  late PokemonFavoriteRepositoryImpl repository;
  late MockPokemonFavoriteLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValue(const Pokemon(id: 0, name: '', image: '', types: []));
  });

  setUp(() {
    mockLocalDataSource = MockPokemonFavoriteLocalDataSource();
    repository = PokemonFavoriteRepositoryImpl(mockLocalDataSource);
  });

  final tPokemon = const Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass'],
    isFavorite: false,
  );

  group('addFavorite', () {
    test(
      'should call  localDataSource.addFavorite and return Right(null)',
      () async {
        // Arrange
        when(
          () => mockLocalDataSource.addFavorite(any()),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.addFavorite(tPokemon);

        // Assert
        expect(result, const Right(null));
        verify(() => mockLocalDataSource.addFavorite(tPokemon)).called(1);
      },
    );

    test(
      'should return Left(CacheFailure) when localDataSource throws',
      () async {
        // Arrange
        when(
          () => mockLocalDataSource.addFavorite(any()),
        ).thenThrow(Exception('database error'));

        // Act
        final result = await repository.addFavorite(tPokemon);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (_) => fail('should have returned Left'),
        );
      },
    );
  });

  group('deleteFavorite', () {
    test(
      'should call localDataSource.deleteFavorite and return Right(null)',
      () async {
        // Arrange
        when(
          () => mockLocalDataSource.deleteFavorite(any()),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.deleteFavorite(tPokemon);

        // Assert
        expect(result, const Right(null));
        verify(() => mockLocalDataSource.deleteFavorite(tPokemon)).called(1);
      },
    );
  });

  group('getFavoritePokemons', () {
    final tFavorites = [tPokemon.copyWith(isFavorite: true)];

    test('should return Right(List<Pokemon>) when successful', () async {
      // Arrange
      when(
        () => mockLocalDataSource.getFavoritePokemons(),
      ).thenAnswer((_) async => tFavorites);

      // Act
      final result = await repository.getFavoritePokemons();

      // Assert
      expect(result, Right(tFavorites));
      verify(() => mockLocalDataSource.getFavoritePokemons()).called(1);
    });
  });

  group('mergeFavorites', () {
    final tPokemons = [tPokemon];
    final tFavorites = [tPokemon.copyWith(isFavorite: true)];

    test('should return merged list with isFavorite correctly set', () async {
      // Arrange
      when(
        () => mockLocalDataSource.getFavoritePokemons(),
      ).thenAnswer((_) async => tFavorites);

      // Act
      final result = await repository.mergeFavorites(tPokemons);

      // Assert
      result.fold((failure) => fail('should have returned Right'), (merged) {
        expect(merged.first.isFavorite, true);
        expect(merged.length, 1);
      });
      verify(() => mockLocalDataSource.getFavoritePokemons()).called(1);
    });
  });
}
