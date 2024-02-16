import 'package:shared_preferences/shared_preferences.dart';

class HyphenSecurePreferences {
  static SharedPreferences? _hyphenSharedPreferences;
  static bool _isInitialized = false;

   static Future<void> initialize() async {
    if (!_isInitialized) {
      _hyphenSharedPreferences = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
  }

  static SharedPreferences getSharedPreferences() {
    if (!_isInitialized) {
      throw StateError("HyphenSecurePreferences is not initialized");
    }

    return _hyphenSharedPreferences!;
  }
}
