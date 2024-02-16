import 'package:json_annotation/json_annotation.dart';

part 'hyphen_recover_key_registration.g.dart';

@JsonSerializable()
class HyphenRecoverKeyRegistration {
  final String publicKey;
  final CloudKey? cloudKey;

  HyphenRecoverKeyRegistration({
    required this.publicKey,
    this.cloudKey,
  });

  factory HyphenRecoverKeyRegistration.fromJson(Map<String, dynamic> json) =>
      _$HyphenRecoverKeyRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRecoverKeyRegistrationToJson(this);
}

@JsonSerializable()
  class CloudKey {
    final String accountName;

    CloudKey({
      required this.accountName,
    });

    factory CloudKey.fromJson(Map<String, dynamic> json) =>
        _$CloudKeyFromJson(json);

    Map<String, dynamic> toJson() => _$CloudKeyToJson(this);
  }
