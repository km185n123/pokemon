import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      // Hardcoded placeholder per implementation plan
      'Tiene una semilla de planta en la espalda desde que nace. La semilla crece lentamente.',
      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
    );
  }
}
