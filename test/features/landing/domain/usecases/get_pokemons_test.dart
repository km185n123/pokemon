import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository mockRepository;
  late GetPokemons useCase;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemons(mockRepository);
  });

  final tPokemons = [
    const Pokemon(id: 1, name: 'bulbasaur', image: 'url', types: ['grass']),
  ];

  group('GetPokemons', () {
    test('should call repository.getPokemons with correct offset', () async {
      // Arrange
      final tOffset = 10;
      when(
        () => mockRepository.getPokemons(any()),
      ).thenAnswer((_) async => Right(tPokemons));

      // Act
      await useCase(tOffset);

      // Assert
      verify(() => mockRepository.getPokemons(tOffset)).called(1);
    });

    test(
      'should return Right(List<Pokemon>) when repository call is successful',
      () async {
        // Arrange
        when(
          () => mockRepository.getPokemons(any()),
        ).thenAnswer((_) async => Right(tPokemons));

        // Act
        final result = await useCase();

        // Assert
        expect(result, Right(tPokemons));
        verify(() => mockRepository.getPokemons(0)).called(1);
      },
    );

    test('should return Left(Failure) when repository call fails', () async {
      // Arrange
      final tFailure = const ServerFailure('error');
      when(
        () => mockRepository.getPokemons(any()),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockRepository.getPokemons(0)).called(1);
    });
  });
}
