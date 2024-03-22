import 'dart:io';

import 'package:flutter/material.dart';

@Deprecated('Use core/platform/network_info.dart')
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@Deprecated('Use core/platform/network_info.dart')
class NetworkInfoImpl implements NetworkInfo {
  final ConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection();
// dataConnectionChecker.hasConnection; //ConnectionChecker.hasConnection();
}

class ConnectionChecker {
  Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
      return false;
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}
