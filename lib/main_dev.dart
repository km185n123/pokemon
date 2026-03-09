import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/main.dart';

void main() {
  final config = AppConfig(
    baseUrl: 'https://pokeapi.co/api/v2/',
    imageBaseUrl: '',
    appName: 'Pokemon Dev',
    environment: AppEnvironment.dev,
    apiKey: '',
  );
  mainCommon(config);
}
