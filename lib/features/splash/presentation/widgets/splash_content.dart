import 'package:pokemon/features/splash/presentation/widgets/footer_splash.dart';
import 'package:pokemon/features/splash/presentation/widgets/logo_splash.dart';
import 'package:pokemon/features/splash/presentation/widgets/progress_bar.dart';
import 'package:pokemon/features/splash/presentation/widgets/title_splash.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: const SafeArea(
        child: Column(
          children: [
            Spacer(),
            LogoSplash(),
            SizedBox(height: 24),
            TitleSplash(),
            Spacer(),
            ProgressBar(),
            SizedBox(height: 24),
            FooterSplash(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
