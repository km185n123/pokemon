import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late GetPokemons usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemons(mockPokemonRepository);
  });

  final tPokemonList = [
    const Pokemon(
      id: 1,
      name: 'bulbasaur',
      image: 'test.jpg',
      types: ['grass'],
    ),
    const Pokemon(id: 2, name: 'ivysaur', image: 'test2.jpg', types: ['grass']),
  ];

  final tPokemons = tPokemonList;

  test(
    'should get list of cat breeds from the repository when execution is successful',
    () async {
      // Arrange
      when(
        () => mockPokemonRepository.getPokemons(),
      ).thenAnswer((_) async => Right(tPokemons));

      // Act
      final result = await usecase();

      // Assert
      result.fold((l) => fail('test failed: $l'), (r) => expect(r, tPokemons));
      verify(() => mockPokemonRepository.getPokemons()).called(1);
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );

  test(
    'should return a Failure from the repository when execution fails',
    () async {
      // Arrange
      const tFailure = ServerFailure('Server Error');
      when(
        () => mockPokemonRepository.getPokemons(),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockPokemonRepository.getPokemons()).called(1);
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
