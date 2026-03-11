import 'package:flutter/material.dart';

class PokemonCardContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color darkerColor;
  final Widget child;

  const PokemonCardContainer({
    super.key,
    required this.backgroundColor,
    required this.darkerColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 140,
            child: Container(
              decoration: BoxDecoration(
                color: darkerColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
