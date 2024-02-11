import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HyphenGoogleAuthenticate {
  
  static const platform = MethodChannel('hyphen_flutter_sdk/google-authenticate');

  static Future<UserCredential?> authenticate(String webClientId) async {
    try {
      final UserCredential result = await platform.invokeMethod('googleAuthenticate', {"webClientId": webClientId});
      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to authenticate: '${e.message}'.");
      }
      return null;
    }
  }
}
