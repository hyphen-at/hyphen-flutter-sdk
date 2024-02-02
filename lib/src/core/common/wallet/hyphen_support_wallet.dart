import 'package:json_annotation/json_annotation.dart';

part 'hyphen_support_wallet.g.dart';

@JsonSerializable()
class HyphenSupportWallet {
  final String name;
  final String kind;

  HyphenSupportWallet({
    required this.name,
    required this.kind,
  });

  factory HyphenSupportWallet.fromJson(Map<String, dynamic> json) =>
      _$HyphenSupportWalletFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenSupportWalletToJson(this);
}
