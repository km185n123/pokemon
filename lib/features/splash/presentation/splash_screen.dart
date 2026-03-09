import 'package:pokemon/core/router/app_routes.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppRoutes.landing);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplashContent());
  }
}
