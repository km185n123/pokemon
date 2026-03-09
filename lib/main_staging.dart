import 'package:flutter/material.dart';
import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig(
    baseUrl: 'https://pokeapi.co/api/v2/',
    imageBaseUrl: '',
    appName: 'Pokemons Staging',
    environment: AppEnvironment.staging,
    apiKey: '',
  );
  await mainCommon(config);
}
