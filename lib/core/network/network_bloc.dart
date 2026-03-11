import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/network/network_info.dart';

enum NetworkStatus { initial, online, offline }

class NetworkBloc extends Cubit<NetworkStatus> {
  final NetworkInfo networkInfo;
  StreamSubscription<bool>? _subscription;

  NetworkBloc(this.networkInfo) : super(NetworkStatus.initial) {
    _init();
  }

  void _init() async {
    // Check initial status
    final isConnected = await networkInfo.isConnected;
    emit(isConnected ? NetworkStatus.online : NetworkStatus.offline);

    // Subscribe to changes
    _subscription = networkInfo.onConnectivityChanged.listen((isConnected) {
      emit(isConnected ? NetworkStatus.online : NetworkStatus.offline);
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
