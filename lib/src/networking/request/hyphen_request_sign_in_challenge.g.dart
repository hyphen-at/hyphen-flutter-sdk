// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_request_sign_in_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRequestSignInChallenge _$HyphenRequestSignInChallengeFromJson(
        Map<String, dynamic> json) =>
    HyphenRequestSignInChallenge(
      challengeType: json['challengeType'] as String,
      request: Request.fromJson(json['request'] as Map<String, dynamic>),
      publicKey: json['publicKey'] as String,
    );

Map<String, dynamic> _$HyphenRequestSignInChallengeToJson(
        HyphenRequestSignInChallenge instance) =>
    <String, dynamic>{
      'challengeType': instance.challengeType,
      'request': instance.request,
      'publicKey': instance.publicKey,
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
