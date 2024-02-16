import 'package:hyphen_flutter_sdk/core/common/key/hyphen_key_type.dart';
import 'package:hyphen_flutter_sdk/core/common/key/hyphen_recover_key.dart';
import 'package:hyphen_flutter_sdk/core/common/key/hyphen_user_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_key.g.dart';

@JsonSerializable()
class HyphenKey {
  final String publicKey;
  final HyphenKeyType type;
  final String name;
  final int keyIndex;
  final HyphenUserKey? userKey;
  final HyphenRecoverKey? recoverKey;
  final String lastUsedAt;

  HyphenKey({
    required this.publicKey,
    required this.type,
    required this.name,
    required this.keyIndex,
    this.userKey,
    this.recoverKey,
    required this.lastUsedAt,
  });

  factory HyphenKey.fromJson(Map<String, dynamic> json) =>
      _$HyphenKeyFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenKeyToJson(this);
}
