// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_request_sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRequestSignUp _$HyphenRequestSignUpFromJson(Map<String, dynamic> json) =>
    HyphenRequestSignUp(
      method: json['method'] as String,
      token: json['token'] as String,
      chainName: json['chainName'] as String,
      userKey: HyphenUserKey.fromJson(json['userKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenRequestSignUpToJson(
        HyphenRequestSignUp instance) =>
    <String, dynamic>{
      'method': instance.method,
      'token': instance.token,
      'chainName': instance.chainName,
      'userKey': instance.userKey,
    };
