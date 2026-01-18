import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  // Singleton instance
  static final ConnectivityController instance =
      ConnectivityController._internal();

  ConnectivityController._internal();

  // افتراض أن isConnected معرف كـ ValueNotifier
  final ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  // 1. تعديل الـ init
  Future<void> init() async {
    final List<ConnectivityResult> result = await Connectivity()
        .checkConnectivity();
    updateConnectionStatus(result); // استدعاء الدالة الجديدة

    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      updateConnectionStatus(results);
    });
  }

  // 2. تعديل دالة التحقق لتتعامل مع List
  void updateConnectionStatus(List<ConnectivityResult> results) {
    // لو القائمة فيها 'none' بس، يبقى مفيش نت
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      isConnected.value = false;
    } else {
      // لو فيها wifi أو mobile أو ethernet يبقى فيه نت
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
