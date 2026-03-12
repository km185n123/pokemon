import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/core/favorite/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class MockGetFavoritePokemons extends Mock implements GetFavoritePokemons {}

class MockDeleteFavoritePokemon extends Mock implements DeleteFavoritePokemon {}

void main() {
  late FavoritesBloc bloc;
  late MockGetFavoritePokemons mockGetFavoritePokemons;
  late MockDeleteFavoritePokemon mockDeleteFavoritePokemon;

  setUpAll(() {
    registerFallbackValue(const Pokemon(id: 0, name: '', image: '', types: []));
  });

  setUp(() {
    mockGetFavoritePokemons = MockGetFavoritePokemons();
    mockDeleteFavoritePokemon = MockDeleteFavoritePokemon();
    bloc = FavoritesBloc(
      getFavoritePokemons: mockGetFavoritePokemons,
      deleteFavoritePokemon: mockDeleteFavoritePokemon,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url',
    types: ['grass'],
    isFavorite: true,
  );

  const tPokemons = [tPokemon];

  test('initial state should be FavoritesInitial', () {
    expect(bloc.state, FavoritesInitial());
  });

  group('FavoritesStarted', () {
    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesLoading, FavoritesLoaded] when data is gotten successfully',
      build: () {
        when(
          () => mockGetFavoritePokemons(),
        ).thenAnswer((_) async => const Right(tPokemons));
        return bloc;
      },
      act: (bloc) => bloc.add(FavoritesStarted()),
      expect: () => [FavoritesLoading(), const FavoritesLoaded(tPokemons)],
      verify: (_) {
        verify(() => mockGetFavoritePokemons()).called(1);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesLoading, FavoritesEmpty] when data is gotten successfully but list is empty',
      build: () {
        when(
          () => mockGetFavoritePokemons(),
        ).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) => bloc.add(FavoritesStarted()),
      expect: () => [FavoritesLoading(), FavoritesEmpty()],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesLoading, FavoritesError] when getting data fails',
      build: () {
        when(
          () => mockGetFavoritePokemons(),
        ).thenAnswer((_) async => Left(CacheFailure('cache error')));
        return bloc;
      },
      act: (bloc) => bloc.add(FavoritesStarted()),
      expect: () => [
        FavoritesLoading(),
        const FavoritesError(CacheFailure('cache error')),
      ],
    );
  });

  group('FavoritesDeleted', () {
    blocTest<FavoritesBloc, FavoritesState>(
      'calls deleteFavoritePokemon and then refreshes the list',
      build: () {
        when(
          () => mockDeleteFavoritePokemon(any()),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => mockGetFavoritePokemons(),
        ).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) => bloc.add(const FavoritesDeleted(tPokemon)),
      expect: () => [FavoritesLoading(), FavoritesEmpty()],
      verify: (_) {
        verify(() => mockDeleteFavoritePokemon(tPokemon)).called(1);
        verify(() => mockGetFavoritePokemons()).called(1);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesError] when deleting fails',
      build: () {
        when(
          () => mockDeleteFavoritePokemon(any()),
        ).thenAnswer((_) async => Left(CacheFailure('delete error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const FavoritesDeleted(tPokemon)),
      expect: () => [const FavoritesError(CacheFailure('delete error'))],
    );
  });
}
