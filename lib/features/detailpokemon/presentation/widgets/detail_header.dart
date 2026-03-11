import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/core/theme/pokemon_color_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/core/widgets/cards/favorite_state.dart';

class DetailHeader extends StatelessWidget {
  final Pokemon pokemon;
  final String heroContext;
  final VoidCallback onBack;

  const DetailHeader({
    super.key,
    required this.pokemon,
    required this.heroContext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final primaryType = pokemon.types.isNotEmpty
        ? pokemon.types.first
        : 'normal';
    final backgroundColor = PokemonColorUtils.getColorByType(primaryType);

    return SizedBox(
      height: screenHeight * 0.45,
      child: Stack(
        children: [
          // Curved background
          ClipPath(
            clipper: _HeaderClipper(),
            child: Container(
              height: screenHeight * 0.4,
              color: backgroundColor,
            ),
          ),
          // Watermark / leaf / pokeball behind image
          Positioned(
            top: MediaQuery.of(context).padding.top + 40,
            left: 0,
            right: 0,
            child: Icon(
              Icons.energy_savings_leaf, // Placeholder for leaf watermark
              size: 250,
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          // Pokemon Image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: '${heroContext}_pokemon_${pokemon.id}',
              child: pokemon.image.isNotEmpty
                  ? Image.network(
                      pokemon.image,
                      height: 220,
                      fit: BoxFit.contain,
                    )
                  : const Icon(
                      Icons.image_not_supported,
                      size: 150,
                      color: Colors.white54,
                    ),
            ),
          ),
          // Navigation controls
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onBack,
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                BlocSelector<FavoriteCubit, FavoriteState, bool>(
                  selector: (state) => state.isFavorite(pokemon.id),
                  builder: (context, isFavorite) {
                    return GestureDetector(
                      onTap: () {
                        context.read<FavoriteCubit>().toggleFavorite(pokemon);
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                        size: 28,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);

    final controlPoint = Offset(size.width / 2, size.height + 60);
    final endpoint = Offset(size.width, size.height - 60);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endpoint.dx,
      endpoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
