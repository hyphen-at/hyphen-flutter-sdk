import 'package:json_annotation/json_annotation.dart';

part 'hyphen_pass_key.g.dart';

@JsonSerializable()
class HyphenPassKey {
  final HyphenPassKeyPlatform platform;

  HyphenPassKey({required this.platform});

  factory HyphenPassKey.fromJson(Map<String, dynamic> json) =>
      _$HyphenPassKeyFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenPassKeyToJson(this);
}

enum HyphenPassKeyPlatform {
  @JsonValue("android")
  ANDROID,

  @JsonValue("iOS")
  IOS,
}
