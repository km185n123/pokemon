import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/router/app_routes.dart';
import 'package:pokemon/core/theme/pokemon_color_utils.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/core/widgets/cards/favorite_state.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'pokemon_card_container.dart';
import 'pokemon_card_images.dart';
import 'pokemon_card_info.dart';
import 'pokemon_favorite_button.dart';

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
  Widget build(BuildContext context) {
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

        widget.onFavoriteToggled?.call();
      },
      child: PokemonCardContainer(
        backgroundColor: backgroundColor,
        darkerColor: darkerColor,
        child: Stack(
          children: [
            PokemonCardImages(
              imageUrl: widget.pokemon.image,
              type: primaryType,
              id: widget.pokemon.id,
              heroContext: widget.heroContext,
            ),
            PokemonCardInfo(
              id: widget.pokemon.id,
              name: widget.pokemon.name,
              types: widget.pokemon.types,
            ),
            BlocSelector<FavoriteCubit, FavoriteState, bool>(
              selector: (state) => state.isFavorite(widget.pokemon.id),
              builder: (context, isFavorite) {
                return PokemonFavoriteButton(
                  isFavorite: isFavorite,
                  onTap: () {
                    context.read<FavoriteCubit>().toggleFavorite(
                      widget.pokemon,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
