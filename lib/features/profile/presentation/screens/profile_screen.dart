import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:pokemon/l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 16),
              SwitchListTile(
                title: Text(l10n.settingsEnableCache),
                subtitle: Text(l10n.settingsEnableCacheSubtitle),
                value: state.isOfflineDbEnabled,
                onChanged: (bool value) {
                  context.read<ProfileCubit>().toggleOfflineDb(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
