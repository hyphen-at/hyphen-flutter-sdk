// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_request_edit_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenRequestEditDevice _$HyphenRequestEditDeviceFromJson(
        Map<String, dynamic> json) =>
    HyphenRequestEditDevice(
      id: json['id'] as String?,
      pushToken: json['pushToken'] as String?,
      name: json['name'] as String?,
      osName: json['osName'] as String?,
      osVersion: json['osVersion'] as String?,
      deviceManufacturer: json['deviceManufacturer'] as String?,
      deviceModel: json['deviceModel'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$HyphenRequestEditDeviceToJson(
        HyphenRequestEditDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pushToken': instance.pushToken,
      'name': instance.name,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'deviceManufacturer': instance.deviceManufacturer,
      'deviceModel': instance.deviceModel,
      'lang': instance.lang,
    };
