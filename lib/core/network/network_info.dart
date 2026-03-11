import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker dataChecker;

  NetworkInfoImpl(this.connectivity, this.dataChecker);

  @override
  Future<bool> get isConnected async {
    return await dataChecker.hasConnection;
  }

  @override
  Stream<bool> get onConnectivityChanged {
    // We listen to connectivity changes, then verify actual data connection
    return connectivity.onConnectivityChanged.asyncMap((event) async {
      return await dataChecker.hasConnection;
    });
  }
}
