import 'package:flutter/material.dart';
import 'package:pokemon/core/config/constants.dart';
import 'package:pokemon/core/widgets/feedback/illustration_feedback.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Regiones',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: IllustrationFeedback(
          imageAsset: Constants.comingSoon,
          title: '¡Muy pronto disponible!',
          subtitle:
              'Estamos trabajando para traerte esta\nsección. Vuelve más adelante para descubrir\ntodas las novedades.',
        ),
      ),
    );
  }
}
