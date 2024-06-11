import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity.g.dart';

@riverpod
Connectivity connectivity(ConnectivityRef ref) {
  return Connectivity.instance;
}

class Connectivity {
  Connectivity._();

  static final instance = Connectivity._();

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      // .timeout(const Duration(seconds: 4));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint('No internet, $e');
      return false;
    }
  }
}
