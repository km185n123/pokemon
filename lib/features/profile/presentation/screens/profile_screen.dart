import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'Almacenamiento Local',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Activar Base de Datos (Caché)'),
                subtitle: const Text(
                  'Si está desactivado, la información de la red no se guardará localmente (excepto los favoritos).',
                ),
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
