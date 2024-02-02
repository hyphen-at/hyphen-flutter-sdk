// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenAccount _$HyphenAccountFromJson(Map<String, dynamic> json) =>
    HyphenAccount(
      id: json['id'] as String,
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => HyphenAccountAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: (json['parent'] as List<dynamic>)
          .map((e) => HyphenAccountAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$HyphenAccountToJson(HyphenAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addresses': instance.addresses,
      'parent': instance.parent,
      'createdAt': instance.createdAt,
    };
