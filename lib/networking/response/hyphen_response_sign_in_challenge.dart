import 'package:json_annotation/json_annotation.dart';

part 'hyphen_response_sign_in_challenge.g.dart';

@JsonSerializable()
class HyphenResponseSignInChallenge {
  final String challengeData;
  final String expiresAt;

  HyphenResponseSignInChallenge({
    required this.challengeData,
    required this.expiresAt,
  });

  factory HyphenResponseSignInChallenge.fromJson(Map<String, dynamic> json) =>
      _$HyphenResponseSignInChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenResponseSignInChallengeToJson(this);
}
