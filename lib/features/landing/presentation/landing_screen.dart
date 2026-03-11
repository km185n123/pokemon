import 'dart:async';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/widgets/feedback/feedback_message.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:pokemon/features/landing/presentation/widgets/pokemon_card.dart';
import 'package:pokemon/features/landing/presentation/widgets/search_bar.dart'
    as custom;

import 'package:pokemon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();
  late StreamSubscription<int> _tabSubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _tabSubscription = getIt<TabEventBus>().tabStream.listen((index) {
      if (index == 0 && mounted) {
        context.read<PokemonsBloc>().add(PokemonsRefreshFavorites());
      }
    });
  }

  @override
  void dispose() {
    _tabSubscription.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PokemonsBloc>().add(PokemonsLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const custom.SearchBar(),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (context, state) {
                  if (state is PokemonsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PokemonsError) {
                    final isNetworkError = state.failure is ConnectionFailure;
                    final l10n = AppLocalizations.of(context)!;
                    return FeedbackMessage(
                      title: isNetworkError
                          ? l10n.connectionLost
                          : l10n.genericError,
                      message: isNetworkError
                          ? l10n.connectionLostMessage
                          : l10n.serverErrorMessage,
                      type: isNetworkError
                          ? FeedbackType.network
                          : FeedbackType.server,
                      onRetry: () {
                        context.read<PokemonsBloc>().add(PokemonsStarted());
                      },
                    );
                  } else if (state is PokemonsLoaded) {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount:
                          state.pokemons.length +
                          (state.isLoadingMore
                              ? 2
                              : 1), // +1 for header, +1 for loading indicator at bottom
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                          );
                        }

                        if (index == state.pokemons.length + 1) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final pokemon = state.pokemons[index - 1];
                        return PokemonCard(
                          pokemon: pokemon,
                          onFavoriteToggled: () {
                            context.read<PokemonsBloc>().add(
                              PokemonsRefreshFavorites(),
                            );
                          },
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
