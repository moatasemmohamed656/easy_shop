import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  static final ConnectivityController instance =
      ConnectivityController._internal();

  ConnectivityController._internal();

  final ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  Future<void> init() async {
    final List<ConnectivityResult> result = await Connectivity()
        .checkConnectivity();
    updateConnectionStatus(result);

    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      updateConnectionStatus(results);
    });
  }

  void updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      isConnected.value = false;
    } else {
      isConnected.value = results.any(
        (result) =>
            result == ConnectivityResult.none ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.ethernet,
      );
    }
  }
}
