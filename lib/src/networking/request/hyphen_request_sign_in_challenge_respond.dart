import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_sign_in_challenge_respond.g.dart';

@JsonSerializable()
class HyphenRequestSignInChallengeRespond {
  final String challengeType;
  final String challengeData;
  final DeviceKey deviceKey;

  HyphenRequestSignInChallengeRespond({
    required this.challengeType,
    required this.challengeData,
    required this.deviceKey,
  });

  factory HyphenRequestSignInChallengeRespond.fromJson(
          Map<String, dynamic> json) =>
      _$HyphenRequestSignInChallengeRespondFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HyphenRequestSignInChallengeRespondToJson(this);
}

@JsonSerializable()
class DeviceKey {
  final String signature;

  DeviceKey({
    required this.signature,
  });

  factory DeviceKey.fromJson(Map<String, dynamic> json) =>
      _$DeviceKeyFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceKeyToJson(this);
}
