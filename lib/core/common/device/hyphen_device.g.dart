// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenDevice _$HyphenDeviceFromJson(Map<String, dynamic> json) => HyphenDevice(
      id: json['id'] as String?,
      publicKey: json['publicKey'] as String,
      pushToken: json['pushToken'] as String,
      name: json['name'] as String,
      osName: $enumDecode(_$HyphenOSNameEnumMap, json['osName']),
      osVersion: json['osVersion'] as String,
      deviceManufacturer: json['deviceManufacturer'] as String,
      deviceModel: json['deviceModel'] as String,
      lang: json['lang'] as String,
      type: $enumDecode(_$HyphenDeviceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$HyphenDeviceToJson(HyphenDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'publicKey': instance.publicKey,
      'pushToken': instance.pushToken,
      'name': instance.name,
      'osName': _$HyphenOSNameEnumMap[instance.osName]!,
      'osVersion': instance.osVersion,
      'deviceManufacturer': instance.deviceManufacturer,
      'deviceModel': instance.deviceModel,
      'lang': instance.lang,
      'type': _$HyphenDeviceTypeEnumMap[instance.type]!,
    };

const _$HyphenOSNameEnumMap = {
  HyphenOSName.IOS: 'IOS',
  HyphenOSName.IPADOS: 'IPADOS',
  HyphenOSName.ANDROID: 'ANDROID',
};

const _$HyphenDeviceTypeEnumMap = {
  HyphenDeviceType.MOBILE: 'mobile',
  HyphenDeviceType.TABLET: 'tablet',
};
