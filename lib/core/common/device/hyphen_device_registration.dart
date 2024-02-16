import 'package:json_annotation/json_annotation.dart';
import 'package:hyphen_flutter_sdk/core/common/hyphen_os_name.dart';

part 'hyphen_device_registration.g.dart';

@JsonSerializable()
class HyphenDeviceRegistration {
  final HyphenOSName osName;
  final String osVersion;
  final String deviceManufacturer;
  final String deviceModel;
  final String lang;

  HyphenDeviceRegistration({
    required this.osName,
    required this.osVersion,
    required this.deviceManufacturer,
    required this.deviceModel,
    required this.lang,
  });

  factory HyphenDeviceRegistration.fromJson(Map<String, dynamic> json) =>
      _$HyphenDeviceRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenDeviceRegistrationToJson(this);
}
