import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/core/router/app_routes.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/services/local_preferences_service.dart';
import 'package:pokemon/features/splash/presentation/widgets/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final splashDuration = getIt<AppConfig>().splashDuration;
    Future.delayed(Duration(seconds: splashDuration), () {
      if (mounted) {
        final hasSeenTutorial =
            getIt<LocalPreferencesService>().hasSeenTutorial;
        if (hasSeenTutorial) {
          context.go(AppRoutes.landing);
        } else {
          context.go(AppRoutes.tutorial);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplashContent());
  }
}
