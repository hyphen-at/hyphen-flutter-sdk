import 'package:json_annotation/json_annotation.dart';

enum HyphenDeviceType {
  @JsonValue("mobile")
  MOBILE,

  @JsonValue("tablet")
  TABLET,
}

String _$HyphenDeviceTypeToJson(HyphenDeviceType type) {
  switch (type) {
    case HyphenDeviceType.MOBILE:
      return 'mobile';
    case HyphenDeviceType.TABLET:
      return 'tablet';
  }
}

HyphenDeviceType _$HyphenDeviceTypeFromJson(String json) {
  switch (json) {
    case 'mobile':
      return HyphenDeviceType.MOBILE;
    case 'tablet':
      return HyphenDeviceType.TABLET;
    default:
      throw ArgumentError('Invalid HyphenDeviceType value: $json');
  }
}
