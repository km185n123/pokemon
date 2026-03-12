import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/features/detailpokemon/domain/usecases/get_pokemon_detail.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_state.dart';

class MockGetPokemonDetailUseCase extends Mock
    implements GetPokemonDetailUseCase {}

void main() {
  late PokemonDetailCubit cubit;
  late MockGetPokemonDetailUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetPokemonDetailUseCase();
    cubit = PokemonDetailCubit(mockUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  const tPokemonDetail = PokemonDetail(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass', 'poison'],
    height: 0.7,
    weight: 6.9,
    description: 'A strange seed was planted on its back at birth.',
    category: 'Seed Pokemon',
    ability: 'Overgrow',
    malePercentage: 87.5,
    femalePercentage: 12.5,
    weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
  );

  test('initial state should be PokemonDetailInitial', () {
    expect(cubit.state, PokemonDetailInitial());
  });

  group('loadPokemonDetail', () {
    blocTest<PokemonDetailCubit, PokemonDetailState>(
      'emits [PokemonDetailLoading, PokemonDetailLoaded] when data is gotten successfully',
      build: () {
        when(
          () => mockUseCase(any()),
        ).thenAnswer((_) async => const Right(tPokemonDetail));
        return cubit;
      },
      act: (cubit) => cubit.loadPokemonDetail(1),
      expect: () => [
        PokemonDetailLoading(),
        const PokemonDetailLoaded(tPokemonDetail),
      ],
      verify: (_) {
        verify(() => mockUseCase(1)).called(1);
      },
    );

    blocTest<PokemonDetailCubit, PokemonDetailState>(
      'emits [PokemonDetailLoading, PokemonDetailError] when getting data fails',
      build: () {
        when(
          () => mockUseCase(any()),
        ).thenAnswer((_) async => Left(ServerFailure('server error')));
        return cubit;
      },
      act: (cubit) => cubit.loadPokemonDetail(1),
      expect: () => [
        PokemonDetailLoading(),
        const PokemonDetailError('server error'),
      ],
    );
  });
}
