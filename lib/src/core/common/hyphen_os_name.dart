import 'package:json_annotation/json_annotation.dart';

enum HyphenOSName {
  IOS,
  IPADOS,
  ANDROID,
}

@JsonSerializable()
class HyphenOSNameConverter implements JsonConverter<HyphenOSName, String> {
  const HyphenOSNameConverter();

  @override
  HyphenOSName fromJson(String json) {
    switch (json) {
      case 'iOS':
        return HyphenOSName.IOS;
      case 'iPadOS':
        return HyphenOSName.IPADOS;
      case 'Android':
        return HyphenOSName.ANDROID;
      default:
        throw ArgumentError('Unknown OS Name: $json');
    }
  }

  @override
  String toJson(HyphenOSName osName) {
    switch (osName) {
      case HyphenOSName.IOS:
        return 'iOS';
      case HyphenOSName.IPADOS:
        return 'iPadOS';
      case HyphenOSName.ANDROID:
        return 'Android';
    }
  }
}
