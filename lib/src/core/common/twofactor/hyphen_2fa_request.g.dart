// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_2fa_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hyphen2FARequest _$Hyphen2FARequestFromJson(Map<String, dynamic> json) =>
    Hyphen2FARequest(
      id: json['id'] as String,
      app: HyphenAppInformation.fromJson(json['app'] as Map<String, dynamic>),
      userOpInfo: Hyphen2FAUserOpInfo.fromJson(
          json['userOpInfo'] as Map<String, dynamic>),
      srcDevice:
          HyphenDevice.fromJson(json['srcDevice'] as Map<String, dynamic>),
      destDevice:
          HyphenDevice.fromJson(json['destDevice'] as Map<String, dynamic>),
      requestedAt: json['requestedAt'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$Hyphen2FARequestToJson(Hyphen2FARequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app': instance.app,
      'userOpInfo': instance.userOpInfo,
      'srcDevice': instance.srcDevice,
      'destDevice': instance.destDevice,
      'requestedAt': instance.requestedAt,
      'message': instance.message,
    };

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
