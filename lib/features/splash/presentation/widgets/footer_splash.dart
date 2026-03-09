import 'package:flutter/material.dart';

class FooterSplash extends StatelessWidget {
  const FooterSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PROFESSIONAL EDITION',
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
