import 'package:flutter/widgets.dart';
import 'package:hyphen_flutter_sdk/src/core/common/credential/hyphen_credential.dart';
import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus.dart';
import 'package:hyphen_flutter_sdk/src/core/preferences/hyphen_secure_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NetworkType { TESTNET, MAINNET }

class Hyphen {
  static String _appSecret = '';
  static NetworkType network = NetworkType.TESTNET;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static String get appSecret => _appSecret;

  static set appSecret(String newValue) {
    if (_appSecret.isEmpty) {
      _appSecret = newValue;
      print('Hyphen appSecret set successfully.');
    } else {
      print('Hyphen appSecret already set.');
    }
  }

  static void initialize(BuildContext context) {
    HyphenEventBus.initialize();
    HyphenSecurePreferences.initialize();
  }

  static void saveCredential(HyphenCredential credential) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'at.hyphen.sdk.credential.accessToken', credential.accessToken);
    preferences.setString(
        'at.hyphen.sdk.credential.refreshToken', credential.refreshToken);
  }

  @visibleForTesting
  static void saveEphemeralAccessToken(String ephemeralAccessToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'at.hyphen.sdk.credential.ephemeralAccessToken', ephemeralAccessToken);
  }

  @visibleForTesting
  static Future<String?> getEphemeralAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences
        .getString('at.hyphen.sdk.credential.ephemeralAccessToken');
  }

  @visibleForTesting
  static void clearEphemeralAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('at.hyphen.sdk.credential.ephemeralAccessToken');
  }

  @visibleForTesting
  static Future<HyphenCredential> getCredential() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accessToken =
        preferences.getString('at.hyphen.sdk.credential.accessToken') ?? '';
    String refreshToken =
        preferences.getString('at.hyphen.sdk.credential.refreshToken') ?? '';

    return HyphenCredential(
        accessToken: accessToken, refreshToken: refreshToken);
  }
}
