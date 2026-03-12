import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';

class MockGetPokemons extends Mock implements GetPokemons {}

class MockGetFavoritePokemons extends Mock implements GetFavoritePokemons {}

void main() {
  late PokemonsBloc bloc;
  late MockGetPokemons mockGetPokemons;
  late MockGetFavoritePokemons mockGetFavoritePokemons;

  setUp(() {
    mockGetPokemons = MockGetPokemons();
    mockGetFavoritePokemons = MockGetFavoritePokemons();
    bloc = PokemonsBloc(
      getPokemons: mockGetPokemons,
      getFavoritePokemons: mockGetFavoritePokemons,
    );
  });

  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass'],
    isFavorite: false,
  );

  const tPokemons = [tPokemon];

  test('initial state should be PokemonsInitial', () {
    expect(bloc.state, PokemonsInitial());
  });

  group('PokemonsStarted', () {
    blocTest<PokemonsBloc, PokemonsState>(
      'emits [PokemonsLoading, PokemonsLoaded] when successful',
      build: () {
        when(
          () => mockGetPokemons(any()),
        ).thenAnswer((_) async => const Right(tPokemons));
        return bloc;
      },
      act: (bloc) => bloc.add(PokemonsStarted()),
      expect: () => [
        PokemonsLoading(),
        const PokemonsLoaded(tPokemons, hasReachedMax: false),
      ],
      verify: (_) {
        verify(() => mockGetPokemons(0)).called(1);
      },
    );

    blocTest<PokemonsBloc, PokemonsState>(
      'emits [PokemonsLoading, PokemonsError] when unsuccessful',
      build: () {
        when(
          () => mockGetPokemons(any()),
        ).thenAnswer((_) async => Left(ServerFailure('error')));
        return bloc;
      },
      act: (bloc) => bloc.add(PokemonsStarted()),
      expect: () => [
        PokemonsLoading(),
        const PokemonsError(ServerFailure('error')),
      ],
    );
  });

  group('PokemonsLoadMore', () {
    const tMorePokemons = [
      Pokemon(id: 2, name: 'ivysaur', image: 'url', types: ['grass']),
    ];

    blocTest<PokemonsBloc, PokemonsState>(
      'emits [PokemonsLoaded(isLoadingMore: true), PokemonsLoaded] when more data is loaded',
      build: () {
        when(
          () => mockGetPokemons(any()),
        ).thenAnswer((_) async => const Right(tMorePokemons));
        return bloc;
      },
      seed: () => const PokemonsLoaded(tPokemons),
      act: (bloc) => bloc.add(PokemonsLoadMore()),
      expect: () => [
        const PokemonsLoaded(tPokemons, isLoadingMore: true),
        const PokemonsLoaded([
          ...tPokemons,
          ...tMorePokemons,
        ], isLoadingMore: false),
      ],
      verify: (_) {
        verify(() => mockGetPokemons(5)).called(1);
      },
    );

    blocTest<PokemonsBloc, PokemonsState>(
      'emits [PokemonsLoaded(isLoadingMore: true), PokemonsLoaded(hasReachedMax: true)] when no more data',
      build: () {
        when(
          () => mockGetPokemons(any()),
        ).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      seed: () => const PokemonsLoaded(tPokemons),
      act: (bloc) => bloc.add(PokemonsLoadMore()),
      expect: () => [
        const PokemonsLoaded(tPokemons, isLoadingMore: true),
        const PokemonsLoaded(
          tPokemons,
          hasReachedMax: true,
          isLoadingMore: false,
        ),
      ],
    );
  });

  group('PokemonsSearch', () {
    blocTest<PokemonsBloc, PokemonsState>(
      'emits Loaded with filtered results when searching',
      build: () {
        // En este BLoC, el filtrado es local, por lo que actúa sobre _allPokemons.
        // Simulamos un estado inicial donde ya hay pokemons cargados internamente.
        return bloc;
      },
      seed: () {
        // Necesitamos popular _allPokemons, pero es un campo privado.
        // PokemonsBloc maneja el estado internamente.
        // Para probar la búsqueda local sin reflexión,
        // el evento anterior debe haber poblado _allPokemons.
        return const PokemonsLoaded([
          tPokemon,
          Pokemon(id: 2, name: 'ivysaur', image: 'url', types: ['grass']),
        ]);
      },
      act: (bloc) async {
        // Primero iniciamos para popular _allPokemons (hack debido a que es privado)
        when(() => mockGetPokemons(any())).thenAnswer(
          (_) async => const Right([
            tPokemon,
            Pokemon(id: 2, name: 'ivysaur', image: 'url', types: ['grass']),
          ]),
        );
        bloc.add(PokemonsStarted());
        bloc.add(const PokemonsSearch('bulba'));
      },
      expect: () => [
        PokemonsLoading(),
        isA<PokemonsLoaded>(), // Initial load
        isA<PokemonsLoaded>().having(
          (s) => s.pokemons.length,
          'length',
          1,
        ), // Search
      ],
    );
  });

  group('PokemonsFilterChanged', () {
    blocTest<PokemonsBloc, PokemonsState>(
      'emits Loaded with filtered results by type',
      build: () => bloc,
      act: (bloc) async {
        when(() => mockGetPokemons(any())).thenAnswer(
          (_) async => const Right([
            tPokemon, // grass
            Pokemon(id: 4, name: 'charmander', image: 'url', types: ['fire']),
          ]),
        );
        bloc.add(PokemonsStarted());
        bloc.add(const PokemonsFilterChanged(['fire']));
      },
      expect: () => [
        PokemonsLoading(),
        isA<PokemonsLoaded>(), // Loaded [bulba, char]
        isA<PokemonsLoaded>()
            .having((s) => s.pokemons.length, 'length', 1)
            .having((s) => s.pokemons.first.name, 'name', 'charmander'),
      ],
    );
  });

  group('PokemonsRefreshFavorites', () {
    blocTest<PokemonsBloc, PokemonsState>(
      'emits Loaded with updated favorites',
      build: () {
        when(
          () => mockGetFavoritePokemons(),
        ).thenAnswer((_) async => const Right([tPokemon]));
        return bloc;
      },
      act: (bloc) async {
        when(
          () => mockGetPokemons(any()),
        ).thenAnswer((_) async => const Right([tPokemon]));
        bloc.add(PokemonsStarted()); // Initial: isFavorite = false
        bloc.add(PokemonsRefreshFavorites());
      },
      expect: () => [
        PokemonsLoading(),
        isA<PokemonsLoaded>(), // Initial load
        isA<PokemonsLoaded>().having(
          (s) => s.pokemons.first.isFavorite,
          'isFavorite',
          true,
        ),
      ],
    );
  });
}
