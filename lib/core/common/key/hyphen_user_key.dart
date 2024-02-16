import 'package:hyphen_flutter_sdk/core/common/device/hyphen_device.dart';
import 'package:hyphen_flutter_sdk/core/common/hyphen_user_type.dart';
import 'package:hyphen_flutter_sdk/core/common/wallet/hyphen_support_wallet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_user_key.g.dart';

@JsonSerializable()
class HyphenUserKey {
  final HyphenUserType type;
  final String? publicKey;
  final HyphenDevice? device;
  final HyphenSupportWallet? wallet;

  HyphenUserKey({
    required this.type,
    this.publicKey,
    this.device,
    this.wallet,
  });

  factory HyphenUserKey.fromJson(Map<String, dynamic> json) =>
      _$HyphenUserKeyFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenUserKeyToJson(this);
}
