import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hyphen_flutter_sdk/src/core/common/key/hyphen_user_key.dart';

class HyphenAuthenticate {

  static const platform = MethodChannel('hyphen_flutter_sdk/authenticate');

  static Future<void> getAccount() async {
    try {
      await platform.invokeMethod<void>('getAccount');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to get account: '${e.message}'.");
      }
    }
  }

  static Future<void> authenticate(String webClientId) async {
    try {
      await platform.invokeMethod<void>('authenticate', {"webClientId": webClientId});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to authenticate: '${e.message}'.");
      }
    }
  }

  static Future<void> updateDeviceInformation() async {
    try {
      await platform.invokeMethod<void>('updateDeviceInformation');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to update device information: '${e.message}'.");
      }
    }
  }

  static Future<void> requestSignIn2FA(String idToken, HyphenUserKey userKey) async {
    try {
      await platform.invokeMethod<void>('requestSignIn2FA', {"idToken": idToken, "userKey": userKey.toJson()});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to request 2FA authentication: '${e.message}'.");
      }
    }
  }

  static Future<HyphenUserKey?> getHyphenUserKey() async {
    try {
      final Map<String, dynamic> result = await platform.invokeMethod('getHyphenUserKey');
      return HyphenUserKey.fromJson(result);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to get Hyphen user key: '${e.message}'.");
      }
      return null;
    }
  }
}
