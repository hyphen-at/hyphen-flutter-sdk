// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_pass_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenPassKey _$HyphenPassKeyFromJson(Map<String, dynamic> json) =>
    HyphenPassKey(
      platform: $enumDecode(_$HyphenPassKeyPlatformEnumMap, json['platform']),
    );

Map<String, dynamic> _$HyphenPassKeyToJson(HyphenPassKey instance) =>
    <String, dynamic>{
      'platform': _$HyphenPassKeyPlatformEnumMap[instance.platform]!,
    };

const _$HyphenPassKeyPlatformEnumMap = {
  HyphenPassKeyPlatform.ANDROID: 'android',
  HyphenPassKeyPlatform.IOS: 'iOS',
};
