import 'package:hyphen_flutter_sdk/core/common/key/hyphen_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_response_keys.g.dart';

@JsonSerializable()
class HyphenResponseKeys {
  final List<HyphenKey> keys;

  HyphenResponseKeys({
    required this.keys,
  });

  factory HyphenResponseKeys.fromJson(Map<String, dynamic> json) =>
      _$HyphenResponseKeysFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenResponseKeysToJson(this);
}
