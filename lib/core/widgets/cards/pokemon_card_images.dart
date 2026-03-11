import 'package:flutter/material.dart';

class PokemonCardImages extends StatelessWidget {
  final String imageUrl;
  final String type;
  final int id;
  final String heroContext;

  const PokemonCardImages({
    super.key,
    required this.imageUrl,
    required this.type,
    required this.id,
    required this.heroContext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20,
          top: 0,
          bottom: 0,
          width: 100,
          child: Transform.rotate(
            angle: -0.11,
            child: Image.asset(
              'assets/images/Pokedex/${type.toLowerCase()}.png',
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ),
        Positioned(
          right: 35,
          bottom: 0,
          top: 8,
          width: 60,
          child: Hero(
            tag: '${heroContext}_pokemon_$id',
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.white54,
                    ),
                  )
                : const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.white54,
                  ),
          ),
        ),
      ],
    );
  }
}
