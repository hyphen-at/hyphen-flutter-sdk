// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_request_sign_in_challenge_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRequestSignInChallengeRespond
    _$HyphenRequestSignInChallengeRespondFromJson(Map<String, dynamic> json) =>
        HyphenRequestSignInChallengeRespond(
          challengeType: json['challengeType'] as String,
          challengeData: json['challengeData'] as String,
          deviceKey:
              DeviceKey.fromJson(json['deviceKey'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$HyphenRequestSignInChallengeRespondToJson(
        HyphenRequestSignInChallengeRespond instance) =>
    <String, dynamic>{
      'challengeType': instance.challengeType,
      'challengeData': instance.challengeData,
      'deviceKey': instance.deviceKey,
    };

DeviceKey _$DeviceKeyFromJson(Map<String, dynamic> json) => DeviceKey(
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$DeviceKeyToJson(DeviceKey instance) => <String, dynamic>{
      'signature': instance.signature,
    };
