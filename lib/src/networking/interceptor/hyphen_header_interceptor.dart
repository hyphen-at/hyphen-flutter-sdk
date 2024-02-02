import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hyphen_flutter_sdk/src/core/hyphen.dart';

class HyphenHeaderInterceptor extends Interceptor {
  
  intercept(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      'X-Hyphen-App-Secret': Hyphen.appSecret,
      'X-Hyphen-SDK-Platform': 'Android', // need to fix
      'X-Hyphen-SDK-Version': '0.1.0',
    });

    final tempAccessToken = await Hyphen.getEphemeralAccessToken();
  if (tempAccessToken != null && tempAccessToken.isNotEmpty) {
    options.headers['Authorization'] = 'Bearer $tempAccessToken';
    Hyphen.clearEphemeralAccessToken();
  } else {
    final credential = await Hyphen.getCredential();
    final accessToken = credential.accessToken;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

    return handler.next(options);
  }
}
