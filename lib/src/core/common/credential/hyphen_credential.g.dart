// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenCredential _$HyphenCredentialFromJson(Map<String, dynamic> json) =>
    HyphenCredential(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$HyphenCredentialToJson(HyphenCredential instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
