import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/features/landing/domain/usecases/add_favorite_pokemon.dart';
import 'package:pokemon/features/landing/domain/usecases/delete_favorite_pokemon.dart';
import 'package:pokemon/core/router/app_routes.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/core/widgets/chips/pokemon_type_badge.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback? onFavoriteToggled;
  final String heroContext;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onFavoriteToggled,
    this.heroContext = 'landing',
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.pokemon.isFavorite;
  }

  @override
  void didUpdateWidget(PokemonCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pokemon.isFavorite != oldWidget.pokemon.isFavorite) {
      isFavorite = widget.pokemon.isFavorite;
    }
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.pokemon.name} guardado en favoritos'),
          ),
        );
      }
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

    widget.onFavoriteToggled?.call();
  }

  @override
  Widget build(BuildContext context) {
    // Default to 'normal' type if list is empty
    final primaryType = widget.pokemon.types.isNotEmpty
        ? widget.pokemon.types.first
        : 'normal';
    final backgroundColor = PokemonColorUtils.getColorByType(primaryType);
    final darkerColor = PokemonColorUtils.getDarkerColorByType(primaryType);

    return GestureDetector(
      onTap: () async {
        await context.push(
          AppRoutes.detail,
          extra: {'pokemon': widget.pokemon, 'heroContext': widget.heroContext},
        );
        // Cuando regresamos de la pantalla de detalle,
        // disparamos el callback para que la lista (Landing o Favoritos)
        // se refresque y aplique cualquier cambio que se haya hecho en los favs.
        widget.onFavoriteToggled?.call();
      },
      child: Container(
        height: 122,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Darker background accent
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
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
            // Type image watermark / background accent
            Positioned(
              right: 20,
              top: 0,
              bottom: -0,
              width: 100,
              child: Transform.rotate(
                angle: -0.11,
                child: Image.asset(
                  'assets/images/Pokedex/${primaryType.toLowerCase()}.png',
                  color: Colors.white.withValues(alpha: 0.60),
                ),
              ),
            ),
            // Pokemon Image
            Positioned(
              right: 35,
              bottom: 0,
              top: 8,
              width: 60,
              child: Hero(
                tag: '${widget.heroContext}_pokemon_${widget.pokemon.id}',
                child: widget.pokemon.image.isNotEmpty
                    ? Image.network(widget.pokemon.image, fit: BoxFit.contain)
                    : const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.white54,
                      ),
              ),
            ),
            // Left content
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nº${widget.pokemon.id.toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    widget.pokemon.name[0].toUpperCase() +
                        widget.pokemon.name.substring(1).toLowerCase(),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: widget.pokemon.types
                        .map((type) => PokemonTypeBadge(type: type))
                        .toList(),
                  ),
                ],
              ),
            ),
            // Favorite Icon (Placing it last to be on top layer with a big touch target)
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggleFavorite,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFavorite
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.3),
                      border: isFavorite
                          ? Border.all(color: Colors.grey.shade300, width: 2)
                          : null,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
