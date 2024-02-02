// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_response_sign_in_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenResponseSignInChallenge _$HyphenResponseSignInChallengeFromJson(
        Map<String, dynamic> json) =>
    HyphenResponseSignInChallenge(
      challengeData: json['challengeData'] as String,
      expiresAt: json['expiresAt'] as String,
    );

Map<String, dynamic> _$HyphenResponseSignInChallengeToJson(
        HyphenResponseSignInChallenge instance) =>
    <String, dynamic>{
      'challengeData': instance.challengeData,
      'expiresAt': instance.expiresAt,
    };
