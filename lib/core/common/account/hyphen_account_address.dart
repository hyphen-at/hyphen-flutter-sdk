import 'package:hyphen_flutter_sdk/core/common/account/hyphen_chain_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_account_address.g.dart';

@JsonSerializable()
class HyphenAccountAddress {
  final String chainName;
  final int? chainId;
  final HyphenChainType chainType;
  final String address;
  final String? domainName;

  HyphenAccountAddress({
    required this.chainName,
    this.chainId,
    required this.chainType,
    required this.address,
    this.domainName,
  });

  factory HyphenAccountAddress.fromJson(Map<String, dynamic> json) =>
      _$HyphenAccountAddressFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenAccountAddressToJson(this);
}
