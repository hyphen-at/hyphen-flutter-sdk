import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_edit_device.g.dart';

@JsonSerializable()
class HyphenRequestEditDevice {
  final String? id;
  final String? pushToken;
  final String? name;
  final String? osName;
  final String? osVersion;
  final String? deviceManufacturer;
  final String? deviceModel;
  final String? lang;

  HyphenRequestEditDevice({
    this.id,
    this.pushToken,
    this.name,
    this.osName,
    this.osVersion,
    this.deviceManufacturer,
    this.deviceModel,
    this.lang,
  });

  factory HyphenRequestEditDevice.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestEditDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestEditDeviceToJson(this);
}
