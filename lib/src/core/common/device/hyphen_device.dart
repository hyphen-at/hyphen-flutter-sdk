import 'package:hyphen_flutter_sdk/src/core/common/device/hyphen_device_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hyphen_flutter_sdk/src/core/common/hyphen_os_name.dart';

part 'hyphen_device.g.dart';

@JsonSerializable()
class HyphenDevice {
  final String? id;
  final String publicKey;
  final String pushToken;
  final String name;
  final HyphenOSName osName;
  final String osVersion;
  final String deviceManufacturer;
  final String deviceModel;
  final String lang;
  final HyphenDeviceType type;

  HyphenDevice({
    this.id,
    required this.publicKey,
    required this.pushToken,
    required this.name,
    required this.osName,
    required this.osVersion,
    required this.deviceManufacturer,
    required this.deviceModel,
    required this.lang,
    required this.type,
  });

  factory HyphenDevice.fromJson(Map<String, dynamic> json) =>
      _$HyphenDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenDeviceToJson(this);
}
