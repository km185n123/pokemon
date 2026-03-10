import 'package:flutter/material.dart';
import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/main.dart';
import 'package:pokemon/core/config/env_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig(
    baseUrl: const String.fromEnvironment(EnvKeys.baseUrl),
    imageBaseUrl: const String.fromEnvironment(EnvKeys.imageBaseUrl),
    appName: const String.fromEnvironment(EnvKeys.appName),
    environment: AppEnvironment.prod,
    apiKey: const String.fromEnvironment(EnvKeys.apiKey),
  );
  await mainCommon(config);
}
