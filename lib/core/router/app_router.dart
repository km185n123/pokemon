import 'package:pokemon/features/detailpokemon/presentation/detail_screen.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_bloc.dart';
import 'package:pokemon/features/landing/presentation/bloc/pokemons_event.dart';
import 'package:pokemon/features/landing/presentation/landing_screen.dart';
import 'package:pokemon/features/splash/presentation/splash_screen.dart';
import 'package:pokemon/features/tutorial/presentation/screens/tutorial_screen.dart';
import 'package:pokemon/features/main_navigation/presentation/screens/main_navigation_screen.dart';
import 'package:pokemon/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:pokemon/features/regions/presentation/screens/regions_screen.dart';
import 'package:pokemon/features/profile/presentation/screens/profile_screen.dart';
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
      path: AppRoutes.tutorial,
      builder: (context, state) => const TutorialScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.landing,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    getIt<PokemonsBloc>()..add(PokemonsStarted()),
                child: const LandingScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.regions,
              builder: (context, state) => const RegionsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.detail,
      builder: (context, state) {
        final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        final pokemon = extra['pokemon'] as Pokemon;
        final heroContext = extra['heroContext'] as String;
        return DetailScreen(pokemon: pokemon, heroContext: heroContext);
      },
    ),
  ],
);
