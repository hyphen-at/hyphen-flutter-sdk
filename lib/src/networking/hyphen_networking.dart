import 'package:dio/dio.dart';
import 'package:hyphen_flutter_sdk/src/core/common/key/hyphen_key.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/auth_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/api/key_api.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_finish.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge_respond.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_up.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_challenge.dart';

final authApi = AuthAPI(Dio());

class Auth {
  static Future<HyphenResponseSignIn2FA> signIn2FA(HyphenRequestSignIn2FA payload) async {
    final response = await authApi.signIn2FA(payload);
    // to-do
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

final keyApi = KeyAPI(Dio());

class Key {
  static Future<List<HyphenKey>> getKeys() async {
    final response = await keyApi.getKeys();
    return response.keys;
  }
}