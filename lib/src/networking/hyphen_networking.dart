import 'package:dio/dio.dart';
import 'package:hyphen_flutter_sdk/src/core/common/account/hyphen_account.dart';
import 'package:hyphen_flutter_sdk/src/core/common/key/hyphen_key.dart';
import 'package:hyphen_flutter_sdk/src/core/hyphen.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/account_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/auth_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/device_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/key_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/sign_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_approve.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_finish.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_edit_device.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_retry_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge_respond.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_up.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_challenge.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_sign_result.dart';

final baseUrl = Hyphen.network == NetworkType.TESTNET
    ? "https://api.dev.hyphen.at/"
    : "https://api.hyphen.at/";

final accountApi = AccountAPI(Dio(), baseUrl: baseUrl);

class Account {
  static Future<HyphenAccount> getAccount() async {
    final response = await accountApi.getMyAccount();
    final account = response.account;
    return account;
  }
}

final authApi = AuthAPI(Dio(), baseUrl: baseUrl);

class Auth {
  static Future<HyphenResponseSignIn2FA> signIn2FA(HyphenRequestSignIn2FA payload) async {
    final response = await authApi.signIn2FA(payload);
    if (response.ephemeralAccessToken != null) {
      Hyphen.saveEphemeralAccessToken(response.ephemeralAccessToken!);
    }
    return response;
  }

  static Future<HyphenResponseSignInChallenge> signInChallenge(HyphenRequestSignInChallenge payload) async {
    final response = await authApi.signInChallenge(payload);
    return response;
  }

  static Future<HyphenResponseSignIn> signInChallengeRespond(HyphenRequestSignInChallengeRespond payload) async {
    final response = await authApi.signInChallengeRespond(payload);
    return response;
  }

  static Future<HyphenResponseSignIn> signUp(HyphenRequestSignUp payload) async {
    final response = await authApi.signUp(payload);
    return response;
  }

  static Future<HyphenResponseSignIn> twoFactorFinish(HyphenRequest2FAFinish payload) async {
    final response = await authApi.twoFactorFinish(payload);
    return response;
  }
}

final deviceApi = DeviceAPI(Dio(), baseUrl: baseUrl);

class Device {
  static Future<void> editDevice(String publicKey, HyphenRequestEditDevice payload) async {
    return await deviceApi.editDevice(publicKey, payload);
  }

  static Future<void> retry2FA(String id, HyphenRequestRetry2FA payload) async {
    return await deviceApi.retry2FA(id, payload);
  }

  static Future<void> deny2FA(String id) async {
    return await deviceApi.deny2FA(id);
  }

  static Future<void> approve2FA(String id, HyphenRequest2FAApprove payload) async {
    return await deviceApi.approve2FA(id, payload);
  }
}

final keyApi = KeyAPI(Dio(), baseUrl: baseUrl);

class Key {
  static Future<List<HyphenKey>> getKeys() async {
    final response = await keyApi.getKeys();
    return response.keys;
  }
}

final signApi = SignAPI(Dio(), baseUrl: baseUrl);

class Sign {
  static Future<HyphenSignResult> signTransactionWithServerKey(String message) async {
    return await signApi.signTransactionWithServerKey(HyphenRequestSign(message: message));
  }

  static Future<HyphenSignResult> signTransactionWithPayMasterKey(String message) async {
    return await signApi.signTransactionWithPayMasterKey(HyphenRequestSign(message: message));
  }
}