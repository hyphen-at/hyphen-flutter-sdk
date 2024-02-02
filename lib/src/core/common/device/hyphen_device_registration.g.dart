// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_device_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenDeviceRegistration _$HyphenDeviceRegistrationFromJson(
        Map<String, dynamic> json) =>
    HyphenDeviceRegistration(
      osName: $enumDecode(_$HyphenOSNameEnumMap, json['osName']),
      osVersion: json['osVersion'] as String,
      deviceManufacturer: json['deviceManufacturer'] as String,
      deviceModel: json['deviceModel'] as String,
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$HyphenDeviceRegistrationToJson(
        HyphenDeviceRegistration instance) =>
    <String, dynamic>{
      'osName': _$HyphenOSNameEnumMap[instance.osName]!,
      'osVersion': instance.osVersion,
      'deviceManufacturer': instance.deviceManufacturer,
      'deviceModel': instance.deviceModel,
      'lang': instance.lang,
    };

const _$HyphenOSNameEnumMap = {
  HyphenOSName.IOS: 'IOS',
  HyphenOSName.IPADOS: 'IPADOS',
  HyphenOSName.ANDROID: 'ANDROID',
};
