import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/base/network_bound_resource.dart';
import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/core/network/api_client.dart';
import 'package:pokemon/core/network/clienthttp/dio_http_engine.dart';
import 'package:pokemon/core/network/clienthttp/http_engine.dart';
import 'package:pokemon/core/network/network_info.dart';
import 'package:pokemon/core/security/device_service.dart';
import 'package:pokemon/core/security/encryption_service.dart';
import 'package:pokemon/core/security/key_derivation.dart';
import 'package:pokemon/core/security/secure_key_service.dart';
import 'package:pokemon/core/security/secure_storage_service.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/services/pokemon_remote_service.dart';
import 'package:pokemon/features/landing/data/services/pokemon_favorite_service.dart';
import 'package:pokemon/features/landing/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:pokemon/features/landing/domain/usecases/add_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/get_favorite_pokemons.dart';
import 'package:pokemon/core/network/dio_client.dart';
import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:pokemon/core/services/local_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/detailpokemon/domain/usecases/get_pokemon_detail.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/core/network/network_bloc.dart';
import 'package:pokemon/features/profile/presentation/cubit/profile_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator(AppConfig config) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => LocalPreferencesService(sharedPreferences));

  getIt.registerLazySingleton(
    () => FavoriteCubit(
      getIt<AddFavoritePokemon>(),
      getIt<DeleteFavoritePokemon>(),
      getIt<GetFavoritePokemons>(),
    )..loadFavorites(),
  );

  // Global Events
  getIt.registerLazySingleton<TabEventBus>(() => TabEventBus());

  // Config
  getIt.registerSingleton<AppConfig>(config);

  // Security
  getIt.registerLazySingleton<DeviceService>(() => DeviceService());
  getIt.registerLazySingleton<EncryptionService>(() => EncryptionService());
  getIt.registerLazySingleton<SecureStorageService>(
    () => const SecureStorageService(),
  );
  getIt.registerLazySingleton<SecureKeyService>(() => const SecureKeyService());

  getIt.registerLazySingleton<KeyDerivationService>(
    () => KeyDerivationService(
      secureKeyService: getIt<SecureKeyService>(),
      deviceService: getIt<DeviceService>(),
    ),
  );

  // Database
  getIt.registerSingletonAsync<AppDatabase>(
    () async => AppDatabase.create(getIt<KeyDerivationService>()),
  );

  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  getIt.registerSingletonAsync<ProfileRepository>(
    () async =>
        ProfileRepositoryImpl(await getIt.getAsync<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );

  // Network
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      getIt<Connectivity>(),
      getIt<InternetConnectionChecker>(),
    ),
  );

  getIt.registerLazySingleton<DioClient>(
    () => DioClient(config: getIt<AppConfig>()),
  );

  getIt.registerLazySingleton<HttpEngine>(
    () => DioHttpEngine(getIt<DioClient>()),
  );

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<HttpEngine>()));

  // Data sources
  getIt.registerLazySingleton<PokemonLocalDataSource>(
    () => PokemonLocalDataSourceImpl(database: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
  );

  // Cache handler
  getIt.registerLazySingleton<CacheHandler>(() => NetworkBoundResource());

  // Services
  getIt.registerLazySingleton<PokemonRemoteService>(
    () => PokemonRemoteService(getIt<PokemonRemoteDataSource>()),
  );

  getIt.registerLazySingleton<PokemonFavoriteService>(
    () => PokemonFavoriteService(getIt<PokemonLocalDataSource>()),
  );

  // Repository
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      getIt<PokemonRemoteService>(),
      getIt<PokemonFavoriteService>(),
      getIt<PokemonLocalDataSource>(),
      getIt<CacheHandler>(),
      getIt<ProfileRepository>(),
    ),
  );

  // Usecases
  getIt.registerLazySingleton(() => GetPokemons(getIt()));
  getIt.registerLazySingleton(() => AddFavoritePokemon(getIt()));
  getIt.registerLazySingleton(() => DeleteFavoritePokemon(getIt()));
  getIt.registerLazySingleton(() => GetFavoritePokemons(getIt()));
  getIt.registerLazySingleton(() => GetPokemonDetailUseCase(getIt()));

  // Blocs
  getIt.registerFactory(
    () => PokemonsBloc(getPokemons: getIt(), getFavoritePokemons: getIt()),
  );
  getIt.registerFactory(
    () => FavoritesBloc(
      getFavoritePokemons: getIt(),
      deleteFavoritePokemon: getIt(),
    ),
  );
  getIt.registerFactory(() => PokemonDetailCubit(getIt()));
  getIt.registerFactory(() => ProfileCubit(getIt()));
  getIt.registerLazySingleton(() => NetworkBloc(getIt<NetworkInfo>()));

  await getIt.allReady();
}
