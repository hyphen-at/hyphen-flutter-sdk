// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthAPI implements AuthAPI {
  _AuthAPI(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'base_url_here';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HyphenResponseSignIn2FA> signIn2FA(
      HyphenRequestSignIn2FA requestPayload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestPayload.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HyphenResponseSignIn2FA>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/v1/signin/2fa',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HyphenResponseSignIn2FA.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HyphenResponseSignInChallenge> signInChallenge(
      HyphenRequestSignInChallenge requestPayload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestPayload.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HyphenResponseSignInChallenge>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/v1/signin/challenge',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HyphenResponseSignInChallenge.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HyphenResponseSignIn> signInChallengeRespond(
      HyphenRequestSignInChallengeRespond requestPayload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestPayload.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HyphenResponseSignIn>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/v1/signin/challenge/respond',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HyphenResponseSignIn.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HyphenResponseSignIn> signUp(
      HyphenRequestSignUp requestPayload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestPayload.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HyphenResponseSignIn>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/v1/signup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HyphenResponseSignIn.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HyphenResponseSignIn> twoFactorFinish(
      HyphenRequest2FAFinish requestPayload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestPayload.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HyphenResponseSignIn>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/v1/signin/2fa/finish',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HyphenResponseSignIn.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
