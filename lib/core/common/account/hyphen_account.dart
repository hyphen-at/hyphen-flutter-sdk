import 'package:hyphen_flutter_sdk/core/common/account/hyphen_account_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_account.g.dart';

@JsonSerializable()
class HyphenAccount {
  final String id;
  final List<HyphenAccountAddress> addresses;
  final List<HyphenAccountAddress> parent;
  final String createdAt;

  HyphenAccount({
    required this.id,
    required this.addresses,
    required this.parent,
    required this.createdAt,
  });

  factory HyphenAccount.fromJson(Map<String, dynamic> json) =>
      _$HyphenAccountFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenAccountToJson(this);
}

