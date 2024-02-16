import 'package:json_annotation/json_annotation.dart';

part 'hyphen_recover_key.g.dart';

@JsonSerializable()
class HyphenRecoverKey {
  final RecoveryType type;
  final CloudKey? cloudKey;

  HyphenRecoverKey({
    required this.type,
    this.cloudKey,
  });

  factory HyphenRecoverKey.fromJson(Map<String, dynamic> json) =>
      _$HyphenRecoverKeyFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRecoverKeyToJson(this);
}

enum RecoveryType {
  @JsonValue("type")
  TYPE,

  @JsonValue("cloudKey")
  CLOUD_KEY,
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
