import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/core/security/device_service.dart';
import 'package:pokemon/core/security/encryption_service.dart';
import 'package:pokemon/core/security/key_derivation.dart';
import 'package:pokemon/core/security/secure_key_service.dart';
import 'package:pokemon/core/security/secure_storage_service.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/landing/domain/usecases/get_pokemons.dart';
import 'package:pokemon/core/network/dio_client.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator(AppConfig config) async {
  // Config
  getIt.registerSingleton<AppConfig>(config);

  // Security Services
  getIt.registerLazySingleton<DeviceService>(() => DeviceService());
  getIt.registerLazySingleton<EncryptionService>(() => EncryptionService());
  getIt.registerLazySingleton<SecureStorageService>(
    () => const SecureStorageService(),
  );
  getIt.registerLazySingleton<SecureKeyService>(() => const SecureKeyService());
  getIt.registerLazySingleton<KeyDerivationService>(
    () =>
        KeyDerivationService(secureKeyService: getIt(), deviceService: getIt()),
  );

  // Local Database
  getIt.registerSingletonAsync<AppDatabase>(
    () async => AppDatabase.create(getIt<KeyDerivationService>()),
  );

  // Local Data Sources
  getIt.registerLazySingleton<PokemonLocalDataSource>(
    () => PokemonLocalDataSourceImpl(database: getIt<AppDatabase>()),
  );

  // External
  getIt.registerLazySingleton<DioClient>(() => DioClient(config: getIt()));
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(dio: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(getIt(), getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPokemons(getIt()));

  // BLoC
  getIt.registerFactory(() => PokemonsBloc(getIt()));
}
