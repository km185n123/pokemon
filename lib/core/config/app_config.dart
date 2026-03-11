enum AppEnvironment { dev, staging, prod }

class AppConfig {
  final String baseUrl;
  final String appName;
  final String apiKey;
  final String imageBaseUrl;
  final AppEnvironment environment;
  final int splashDuration;

  AppConfig({
    required this.baseUrl,
    required this.appName,
    required this.apiKey,
    required this.imageBaseUrl,
    required this.environment,
    this.splashDuration = 4,
  });
}
