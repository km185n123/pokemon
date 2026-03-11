import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/network/network_bloc.dart';

class GlobalNetworkBanner extends StatelessWidget {
  final Widget child;

  const GlobalNetworkBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkStatus>(
      builder: (context, status) {
        return Stack(
          children: [
            child,
            if (status == NetworkStatus.offline)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
                child: Material(
                  color: Colors.redAccent,
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    width: double.infinity,
                    color: Colors.redAccent,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Sin conexión a Internet',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
