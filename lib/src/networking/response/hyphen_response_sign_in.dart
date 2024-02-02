import 'package:hyphen_flutter_sdk/src/core/common/account/hyphen_account.dart';
import 'package:hyphen_flutter_sdk/src/core/common/credential/hyphen_credential.dart';
import 'package:hyphen_flutter_sdk/src/core/common/transaction/hyphen_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_response_sign_in.g.dart';

@JsonSerializable()
class HyphenResponseSignIn {
  final HyphenAccount account;
  final HyphenCredential credentials;
  final HyphenTransaction? transaction;

  HyphenResponseSignIn({
    required this.account,
    required this.credentials,
    this.transaction,
  });

  factory HyphenResponseSignIn.fromJson(Map<String, dynamic> json) =>
      _$HyphenResponseSignInFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenResponseSignInToJson(this);
}
