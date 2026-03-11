import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/widgets/feedback/feedback_message.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class LandingErrorView extends StatelessWidget {
  final Failure failure;

  const LandingErrorView({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    final isNetworkError = failure is ConnectionFailure;
    final l10n = AppLocalizations.of(context)!;

    return FeedbackMessage(
      title: isNetworkError ? l10n.connectionLost : l10n.genericError,
      message: isNetworkError
          ? l10n.connectionLostMessage
          : l10n.serverErrorMessage,
      type: isNetworkError ? FeedbackType.network : FeedbackType.server,
      onRetry: () {
        context.read<PokemonsBloc>().add(PokemonsStarted());
      },
    );
  }
}
