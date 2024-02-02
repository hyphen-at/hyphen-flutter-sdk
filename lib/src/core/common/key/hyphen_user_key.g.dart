// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_user_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenUserKey _$HyphenUserKeyFromJson(Map<String, dynamic> json) =>
    HyphenUserKey(
      type: $enumDecode(_$HyphenUserTypeEnumMap, json['type']),
      publicKey: json['publicKey'] as String?,
      device: json['device'] == null
          ? null
          : HyphenDevice.fromJson(json['device'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : HyphenSupportWallet.fromJson(
              json['wallet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenUserKeyToJson(HyphenUserKey instance) =>
    <String, dynamic>{
      'type': _$HyphenUserTypeEnumMap[instance.type]!,
      'publicKey': instance.publicKey,
      'device': instance.device,
      'wallet': instance.wallet,
    };

const _$HyphenUserTypeEnumMap = {
  HyphenUserType.DEVICE: 'device',
  HyphenUserType.PASSKEY: 'passkey',
  HyphenUserType.WALLET: 'wallet',
};
