import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_finish.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge_respond.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_up.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_2fa.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_challenge.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "base_url_here")
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String baseUrl}) = _AuthAPI;

  @POST("auth/v1/signin/2fa")
  Future<HyphenResponseSignIn2FA> signIn2FA(@Body() HyphenRequestSignIn2FA requestPayload);

  @POST("auth/v1/signin/challenge")
  Future<HyphenResponseSignInChallenge> signInChallenge(@Body() HyphenRequestSignInChallenge requestPayload);

  @POST("auth/v1/signin/challenge/respond")
  Future<HyphenResponseSignIn> signInChallengeRespond(@Body() HyphenRequestSignInChallengeRespond requestPayload);

  @POST("auth/v1/signup")
  Future<HyphenResponseSignIn> signUp(@Body() HyphenRequestSignUp requestPayload);

  @POST("auth/v1/signin/2fa/finish")
  Future<HyphenResponseSignIn> twoFactorFinish(@Body() HyphenRequest2FAFinish requestPayload);
}