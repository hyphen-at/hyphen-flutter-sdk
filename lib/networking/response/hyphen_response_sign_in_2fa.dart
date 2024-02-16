import 'package:hyphen_flutter_sdk/core/common/twofactor/hyphen_2fa_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_response_sign_in_2fa.g.dart';

@JsonSerializable()
class HyphenResponseSignIn2FA {
  final Hyphen2FAStatus twoFactorAuth;
  final String? ephemeralAccessToken;

  HyphenResponseSignIn2FA({
    required this.twoFactorAuth,
    this.ephemeralAccessToken,
  });

  factory HyphenResponseSignIn2FA.fromJson(Map<String, dynamic> json) =>
      _$HyphenResponseSignIn2FAFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenResponseSignIn2FAToJson(this);
}
