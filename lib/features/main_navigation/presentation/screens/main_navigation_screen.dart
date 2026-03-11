import 'package:pokemon/core/events/tab_event_bus.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class MainNavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationScreen({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    if (index != navigationShell.currentIndex) {
      getIt<TabEventBus>().tabChanged(index);
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.catching_pokemon),
            label: l10n.navPokedex,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: l10n.navFavorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: l10n.navRegions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: l10n.navProfile,
          ),
        ],
      ),
    );
  }
}
