import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:pokemon/core/config/Constants.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 450,
      child: Lottie.asset(Constants.logo, fit: BoxFit.contain),
    );
  }
}
