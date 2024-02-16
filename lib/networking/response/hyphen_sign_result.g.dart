// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_sign_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenSignResult _$HyphenSignResultFromJson(Map<String, dynamic> json) =>
    HyphenSignResult(
      signature: Signature.fromJson(json['signature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenSignResultToJson(HyphenSignResult instance) =>
    <String, dynamic>{
      'signature': instance.signature,
    };

Signature _$SignatureFromJson(Map<String, dynamic> json) => Signature(
      addr: json['addr'] as String,
      keyId: json['keyId'] as int,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
      'addr': instance.addr,
      'keyId': instance.keyId,
      'signature': instance.signature,
    };
