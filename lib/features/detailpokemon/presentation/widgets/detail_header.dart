import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_color_utils.dart';
import 'package:pokemon/features/landing/domain/usecases/add_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;

  const DetailHeader({super.key, required this.pokemon, required this.onBack});

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.pokemon.isFavorite;
  }

  void _toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      final updatedPokemon = Pokemon(
        id: widget.pokemon.id,
        name: widget.pokemon.name,
        image: widget.pokemon.image,
        types: widget.pokemon.types,
        isFavorite: true,
      );
      await getIt<AddFavoritePokemon>().call(updatedPokemon);
    } else {
      final updatedPokemon = Pokemon(
        id: widget.pokemon.id,
        name: widget.pokemon.name,
        image: widget.pokemon.image,
        types: widget.pokemon.types,
        isFavorite: false,
      );
      await getIt<DeleteFavoritePokemon>().call(updatedPokemon);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final primaryType = widget.pokemon.types.isNotEmpty
        ? widget.pokemon.types.first
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
              tag: 'pokemon_${widget.pokemon.id}',
              child: widget.pokemon.image.isNotEmpty
                  ? Image.network(
                      widget.pokemon.image,
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
                  onTap: widget.onBack,
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 28,
                  ),
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
