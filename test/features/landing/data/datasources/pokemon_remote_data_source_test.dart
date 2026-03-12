import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/network/api_client.dart';
import 'package:pokemon/core/network/requeststrategy/request_strategy.dart';
import 'package:pokemon/core/network/requeststrategy/get_strategy.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';
import 'package:pokemon/features/landing/data/dto/sprites_dto.dart';

class MockApiClient extends Mock implements ApiClient {}

class FakeRequestStrategy extends Fake implements RequestStrategy {}

void main() {
  late MockApiClient mockApiClient;
  late PokemonRemoteDataSourceImpl dataSource;

  setUpAll(() {
    registerFallbackValue(FakeRequestStrategy());
  });

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = PokemonRemoteDataSourceImpl(apiClient: mockApiClient);
  });

  group('getPokemons', () {
    final tOffset = 0;
    final tResponse = const PokemonListResponseDto(count: 1, results: []);

    test(
      'should return Right(PokemonListResponseDto) when call is successful',
      () async {
        // Arrange
        when(
          () => mockApiClient.request<PokemonListResponseDto>(
            any(),
            any(),
            any(),
            query: any(named: 'query'),
          ),
        ).thenAnswer((_) async => Right(tResponse));

        // Act
        final result = await dataSource.getPokemons(tOffset);

        // Assert
        expect(result, Right(tResponse));
        verify(
          () => mockApiClient.request<PokemonListResponseDto>(
            any(that: isA<GetStrategy>()),
            any(),
            any(),
            query: {'offset': tOffset, 'limit': 5},
          ),
        ).called(1);
      },
    );

    test('should return Left(Failure) when call fails', () async {
      // Arrange
      final tFailure = const ServerFailure('error');
      when(
        () => mockApiClient.request<PokemonListResponseDto>(
          any(),
          any(),
          any(),
          query: any(named: 'query'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await dataSource.getPokemons(tOffset);

      // Assert
      expect(result, Left(tFailure));
    });
  });

  group('getPokemonDetail', () {
    final tUrl = 'any_url';
    final tResponse = const PokemonDetailDto(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      types: [],
      sprites: SpritesDto(),
      abilities: [],
    );

    test(
      'should return Right(PokemonDetailDto) when call is successful',
      () async {
        // Arrange
        when(
          () => mockApiClient.request<PokemonDetailDto>(any(), any(), any()),
        ).thenAnswer((_) async => Right(tResponse));

        // Act
        final result = await dataSource.getPokemonDetail(tUrl);

        // Assert
        expect(result, Right(tResponse));
        verify(
          () => mockApiClient.request<PokemonDetailDto>(
            any(that: isA<GetStrategy>()),
            tUrl,
            any(),
          ),
        ).called(1);
      },
    );
  });

  group('getPokemonSpecies', () {
    final tId = 1;
    final tResponse = const PokemonSpeciesDto(
      flavorTextEntries: [],
      genera: [],
      genderRate: 1,
    );

    test(
      'should return Right(PokemonSpeciesDto) when call is successful',
      () async {
        // Arrange
        when(
          () => mockApiClient.request<PokemonSpeciesDto>(any(), any(), any()),
        ).thenAnswer((_) async => Right(tResponse));

        // Act
        final result = await dataSource.getPokemonSpecies(tId);

        // Assert
        expect(result, Right(tResponse));
        verify(
          () => mockApiClient.request<PokemonSpeciesDto>(
            any(that: isA<GetStrategy>()),
            any(that: contains(tId.toString())),
            any(),
          ),
        ).called(1);
      },
    );
  });
}
