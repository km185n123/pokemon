import 'package:flutter/material.dart';
import 'package:pokemon/core/config/Constants.dart';
import 'package:pokemon/core/widgets/feedback/illustration_feedback.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class FavoritesEmptyView extends StatelessWidget {
  const FavoritesEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: IllustrationFeedback(
        imageAsset: Constants.fishEmpty,
        title: l10n.favoritesEmpty,
        subtitle: l10n.favoritesEmptySubtitle,
      ),
    );
  }
}
