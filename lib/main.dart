import 'package:pokemon/core/config/app_config.dart';
import 'package:pokemon/core/router/app_router.dart';
import 'package:pokemon/core/theme/app_theme.dart';
import 'package:pokemon/core/di/service_locator.dart';
import 'package:pokemon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/widgets/cards/favorite_cubit.dart';
import 'package:pokemon/core/network/network_bloc.dart';
import 'package:pokemon/core/widgets/global_network_banner.dart';

Future<void> mainCommon(AppConfig config) async {
  await setupServiceLocator(config);
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
        BlocProvider(create: (_) => getIt<NetworkBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
        builder: (context, child) {
          return GlobalNetworkBanner(child: child!);
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
