import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    // Flutter Web (Chrome)
    if (kIsWeb) return 'http://localhost:8000';

    // Android emulator
    return 'http://10.0.2.2:8000';
  }
}