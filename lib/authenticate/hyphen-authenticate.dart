import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/core/common/account/hyphen_account.dart';

class HyphenAuthenticate {

  static const platform = MethodChannel('hyphen_flutter_sdk/authenticate');

  static Future<HyphenAccount?> getAccount() async {
    try {
      return await platform.invokeMethod<HyphenAccount>('getAccount');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to get account: '${e.message}'.");
      }
      return null;
    }
  }

  static Future<void> authenticate(String webClientId) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await platform.invokeMethod<void>('authenticate', {"webClientId": webClientId});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to authenticate: '${e.message}'.");
      }
    }
  }
}
