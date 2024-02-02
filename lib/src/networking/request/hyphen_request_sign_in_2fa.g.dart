// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_request_sign_in_2fa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRequestSignIn2FA _$HyphenRequestSignIn2FAFromJson(
        Map<String, dynamic> json) =>
    HyphenRequestSignIn2FA(
      request: Request.fromJson(json['request'] as Map<String, dynamic>),
      userKey: HyphenUserKey.fromJson(json['userKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenRequestSignIn2FAToJson(
        HyphenRequestSignIn2FA instance) =>
    <String, dynamic>{
      'request': instance.request,
      'userKey': instance.userKey,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      method: json['method'] as String,
      token: json['token'] as String,
      chainName: json['chainName'] as String,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'method': instance.method,
      'token': instance.token,
      'chainName': instance.chainName,
    };
