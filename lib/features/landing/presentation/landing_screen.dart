import 'dart:async';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_state.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_search_header.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_pokemon_list.dart';
import 'package:pokemon/features/landing/presentation/widgets/landing_error_view.dart';
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
            const LandingSearchHeader(),
            const SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (context, state) {
                  if (state is PokemonsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PokemonsError) {
                    return LandingErrorView(failure: state.failure);
                  } else if (state is PokemonsLoaded) {
                    return LandingPokemonList(
                      scrollController: _scrollController,
                      state: state,
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
