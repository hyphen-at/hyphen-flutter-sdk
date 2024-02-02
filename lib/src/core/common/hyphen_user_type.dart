import 'package:json_annotation/json_annotation.dart';

enum HyphenUserType {
  @JsonValue('device')
  DEVICE,

  @JsonValue('passkey')
  PASSKEY,

  @JsonValue('wallet')
  WALLET,
}

@JsonSerializable()
class HyphenUserTypeConverter implements JsonConverter<HyphenUserType, String> {
  const HyphenUserTypeConverter();

  @override
  HyphenUserType fromJson(String json) {
    switch (json) {
      case 'device':
        return HyphenUserType.DEVICE;
      case 'passkey':
        return HyphenUserType.PASSKEY;
      case 'wallet':
        return HyphenUserType.WALLET;
      default:
        throw ArgumentError('Unknown User Type: $json');
    }
  }

  @override
  String toJson(HyphenUserType userType) {
    switch (userType) {
      case HyphenUserType.DEVICE:
        return 'device';
      case HyphenUserType.PASSKEY:
        return 'passkey';
      case HyphenUserType.WALLET:
        return 'wallet';
    }
  }
}
