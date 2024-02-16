// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_recover_key_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRecoverKeyRegistration _$HyphenRecoverKeyRegistrationFromJson(
        Map<String, dynamic> json) =>
    HyphenRecoverKeyRegistration(
      publicKey: json['publicKey'] as String,
      cloudKey: json['cloudKey'] == null
          ? null
          : CloudKey.fromJson(json['cloudKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenRecoverKeyRegistrationToJson(
        HyphenRecoverKeyRegistration instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'cloudKey': instance.cloudKey,
    };

CloudKey _$CloudKeyFromJson(Map<String, dynamic> json) => CloudKey(
      accountName: json['accountName'] as String,
    );

Map<String, dynamic> _$CloudKeyToJson(CloudKey instance) => <String, dynamic>{
      'accountName': instance.accountName,
    };
