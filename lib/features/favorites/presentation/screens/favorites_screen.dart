import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:pokemon/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/core/widgets/cards/favorite_state.dart';
import 'package:pokemon/features/favorites/presentation/widgets/favorites_empty_view.dart';
import 'package:pokemon/features/favorites/presentation/widgets/favorites_list.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late StreamSubscription<int> _tabSubscription;
  late FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    super.initState();
    _favoritesBloc = getIt<FavoritesBloc>()..add(FavoritesStarted());

    _tabSubscription = getIt<TabEventBus>().tabStream.listen((index) {
      if (index == 1 && mounted) {
        _favoritesBloc.add(FavoritesStarted());
      }
    });
  }

  @override
  void dispose() {
    _tabSubscription.cancel();
    _favoritesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider.value(
      value: _favoritesBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.favoritesTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
          centerTitle: true,
        ),
        body: BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            _favoritesBloc.add(FavoritesStarted());
          },
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              return switch (state) {
                FavoritesLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                FavoritesError(:final failure) => Center(
                  child: Text(failure.message),
                ),
                FavoritesEmpty() => const FavoritesEmptyView(),
                FavoritesLoaded(:final pokemons) => FavoritesList(
                  pokemons: pokemons,
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
