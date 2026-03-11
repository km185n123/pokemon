import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 450,
      child: Lottie.asset('assets/anim/pokebola.json', fit: BoxFit.contain),
    );
  }
}
