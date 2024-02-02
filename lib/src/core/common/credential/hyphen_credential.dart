import 'package:json_annotation/json_annotation.dart';

part 'hyphen_credential.g.dart';

@JsonSerializable()
class HyphenCredential {
  final String accessToken;
  final String refreshToken;

  HyphenCredential({
    required this.accessToken,
    required this.refreshToken,
  });

  factory HyphenCredential.fromJson(Map<String, dynamic> json) =>
      _$HyphenCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenCredentialToJson(this);
}
