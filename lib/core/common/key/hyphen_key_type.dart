import 'package:json_annotation/json_annotation.dart';

enum HyphenKeyType {
  USER_KEY,
  RECOVER_KEY,
  SERVER_KEY,
}

class HyphenKeyTypeConverter implements JsonConverter<HyphenKeyType, String> {
  const HyphenKeyTypeConverter();

  @override
  HyphenKeyType fromJson(String json) {
    switch (json) {
      case 'user-key':
        return HyphenKeyType.USER_KEY;
      case 'recover-key':
        return HyphenKeyType.RECOVER_KEY;
      case 'server-key':
        return HyphenKeyType.SERVER_KEY;
      default:
        throw ArgumentError('Unknown HyphenKeyType value: $json');
    }
  }

  @override
  String toJson(HyphenKeyType type) {
    switch (type) {
      case HyphenKeyType.USER_KEY:
        return 'user-key';
      case HyphenKeyType.RECOVER_KEY:
        return 'recover-key';
      case HyphenKeyType.SERVER_KEY:
        return 'server-key';
    }
  }
}