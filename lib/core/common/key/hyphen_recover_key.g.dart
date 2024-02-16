// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_recover_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRecoverKey _$HyphenRecoverKeyFromJson(Map<String, dynamic> json) =>
    HyphenRecoverKey(
      type: $enumDecode(_$RecoveryTypeEnumMap, json['type']),
      cloudKey: json['cloudKey'] == null
          ? null
          : CloudKey.fromJson(json['cloudKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenRecoverKeyToJson(HyphenRecoverKey instance) =>
    <String, dynamic>{
      'type': _$RecoveryTypeEnumMap[instance.type]!,
      'cloudKey': instance.cloudKey,
    };

const _$RecoveryTypeEnumMap = {
  RecoveryType.TYPE: 'type',
  RecoveryType.CLOUD_KEY: 'cloudKey',
};

CloudKey _$CloudKeyFromJson(Map<String, dynamic> json) => CloudKey(
      accountName: json['accountName'] as String,
    );

Map<String, dynamic> _$CloudKeyToJson(CloudKey instance) => <String, dynamic>{
      'accountName': instance.accountName,
    };
