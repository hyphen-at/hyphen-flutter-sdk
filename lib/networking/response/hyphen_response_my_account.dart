import 'package:hyphen_flutter_sdk/core/common/account/hyphen_account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_response_my_account.g.dart';

@JsonSerializable()
class HyphenResponseMyAccount {
  final HyphenAccount account;

  HyphenResponseMyAccount({required this.account});

  factory HyphenResponseMyAccount.fromJson(Map<String, dynamic> json) =>
      _$HyphenResponseMyAccountFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenResponseMyAccountToJson(this);
}
