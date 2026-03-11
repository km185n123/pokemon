import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/network/network_bloc.dart';
import 'package:pokemon/l10n/app_localizations.dart';

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wifi_off,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)?.offlineBanner ??
                              'No Internet Connection',
                          style: const TextStyle(
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
