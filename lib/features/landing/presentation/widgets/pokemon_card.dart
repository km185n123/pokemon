import 'package:pokemon/core/router/app_routes.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Default to 'normal' type if list is empty
    final primaryType = pokemon.types.isNotEmpty
        ? pokemon.types.first
        : 'normal';
    final backgroundColor = PokemonColorUtils.getColorByType(primaryType);
    final darkerColor = PokemonColorUtils.getDarkerColorByType(primaryType);

    return GestureDetector(
      onTap: () => context.push(AppRoutes.detail, extra: pokemon),
      child: Container(
        height: 140,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Pokeball watermark / background accent
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 140,
              child: Container(
                decoration: BoxDecoration(
                  color: darkerColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
              ),
            ),
            // Light highlight swoosh on the right
            Positioned(
              right: 20,
              top: 20,
              bottom: -20,
              width: 100,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            // Favorite Icon
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            // Pokemon Image
            Positioned(
              right: 16,
              bottom: 8,
              top: 8,
              width: 100,
              child: Hero(
                tag: 'pokemon_${pokemon.id}',
                child: pokemon.image.isNotEmpty
                    ? Image.network(pokemon.image, fit: BoxFit.contain)
                    : const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.white54,
                      ),
              ),
            ),
            // Left content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nº${pokemon.id.toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pokemon.name[0].toUpperCase() +
                        pokemon.name.substring(1).toLowerCase(),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: pokemon.types
                        .map((type) => _buildTypeChip(type))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    final color = PokemonColorUtils.getDarkerColorByType(type);
    final icon = PokemonColorUtils.getIconByType(type);

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 10, color: color),
          ),
          const SizedBox(width: 4),
          Text(
            type[0].toUpperCase() + type.substring(1).toLowerCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
