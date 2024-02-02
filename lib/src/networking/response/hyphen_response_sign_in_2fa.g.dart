// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_response_sign_in_2fa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenResponseSignIn2FA _$HyphenResponseSignIn2FAFromJson(
        Map<String, dynamic> json) =>
    HyphenResponseSignIn2FA(
      twoFactorAuth: Hyphen2FAStatus.fromJson(
          json['twoFactorAuth'] as Map<String, dynamic>),
      ephemeralAccessToken: json['ephemeralAccessToken'] as String?,
    );

Map<String, dynamic> _$HyphenResponseSignIn2FAToJson(
        HyphenResponseSignIn2FA instance) =>
    <String, dynamic>{
      'twoFactorAuth': instance.twoFactorAuth,
      'ephemeralAccessToken': instance.ephemeralAccessToken,
    };
