import 'package:pokemon/features/detailpokemon/presentation/detail_screen.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/landing_screen.dart';
import 'package:pokemon/features/splash/presentation/splash_screen.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/core/router/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.landing,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PokemonsBloc>()..add(PokemonsStarted()),
        child: const LandingScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.detail,
      builder: (context, state) {
        final pokemon = state.extra as Pokemon;
        return DetailScreen(pokemon: pokemon);
      },
    ),
  ],
);
