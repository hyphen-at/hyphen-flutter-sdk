// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_response_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenResponseKeys _$HyphenResponseKeysFromJson(Map<String, dynamic> json) =>
    HyphenResponseKeys(
      keys: (json['keys'] as List<dynamic>)
          .map((e) => HyphenKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HyphenResponseKeysToJson(HyphenResponseKeys instance) =>
    <String, dynamic>{
      'keys': instance.keys,
    };
