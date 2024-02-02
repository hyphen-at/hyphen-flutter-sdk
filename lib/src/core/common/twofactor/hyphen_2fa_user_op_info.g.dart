// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_2fa_user_op_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hyphen2FAUserOpInfo _$Hyphen2FAUserOpInfoFromJson(Map<String, dynamic> json) =>
    Hyphen2FAUserOpInfo(
      type: json['type'] as String,
      signIn: SignIn.fromJson(json['signIn'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Hyphen2FAUserOpInfoToJson(
        Hyphen2FAUserOpInfo instance) =>
    <String, dynamic>{
      'type': instance.type,
      'signIn': instance.signIn,
    };

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      location: json['location'] as String,
      ip: json['ip'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'location': instance.location,
      'ip': instance.ip,
      'email': instance.email,
    };
