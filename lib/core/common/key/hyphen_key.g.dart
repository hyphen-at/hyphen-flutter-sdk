// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenKey _$HyphenKeyFromJson(Map<String, dynamic> json) => HyphenKey(
      publicKey: json['publicKey'] as String,
      type: $enumDecode(_$HyphenKeyTypeEnumMap, json['type']),
      name: json['name'] as String,
      keyIndex: json['keyIndex'] as int,
      userKey: json['userKey'] == null
          ? null
          : HyphenUserKey.fromJson(json['userKey'] as Map<String, dynamic>),
      recoverKey: json['recoverKey'] == null
          ? null
          : HyphenRecoverKey.fromJson(
              json['recoverKey'] as Map<String, dynamic>),
      lastUsedAt: json['lastUsedAt'] as String,
    );

Map<String, dynamic> _$HyphenKeyToJson(HyphenKey instance) => <String, dynamic>{
      'publicKey': instance.publicKey,
      'type': _$HyphenKeyTypeEnumMap[instance.type]!,
      'name': instance.name,
      'keyIndex': instance.keyIndex,
      'userKey': instance.userKey,
      'recoverKey': instance.recoverKey,
      'lastUsedAt': instance.lastUsedAt,
    };

const _$HyphenKeyTypeEnumMap = {
  HyphenKeyType.USER_KEY: 'USER_KEY',
  HyphenKeyType.RECOVER_KEY: 'RECOVER_KEY',
  HyphenKeyType.SERVER_KEY: 'SERVER_KEY',
};
