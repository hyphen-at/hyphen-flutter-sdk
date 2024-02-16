import 'package:hyphen_flutter_sdk/core/common/key/hyphen_public_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_sign_in_challenge.g.dart';

@JsonSerializable()
class HyphenRequestSignInChallenge {
  final String challengeType;
  final Request request;
  final HyphenPublicKey publicKey;

  HyphenRequestSignInChallenge({
    required this.challengeType,
    required this.request,
    required this.publicKey,
  });

  factory HyphenRequestSignInChallenge.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestSignInChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestSignInChallengeToJson(this);
}

@JsonSerializable()
class Request {
  final String method;
  final String token;
  final String chainName;

  Request({
    required this.method,
    required this.token,
    required this.chainName,
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
