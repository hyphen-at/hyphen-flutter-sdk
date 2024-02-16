import 'package:json_annotation/json_annotation.dart';

enum Hyphen2FAStatusType {
  @JsonValue("pending")
  PENDING,

  @JsonValue("approved")
  APPROVED,

  @JsonValue("denied")
  DENIED,
}

String _$Hyphen2FAStatusTypeToJson(Hyphen2FAStatusType status) {
  switch (status) {
    case Hyphen2FAStatusType.PENDING:
      return 'pending';
    case Hyphen2FAStatusType.APPROVED:
      return 'approved';
    case Hyphen2FAStatusType.DENIED:
      return 'denied';
  }
}

Hyphen2FAStatusType _$Hyphen2FAStatusTypeFromJson(String json) {
  switch (json) {
    case 'pending':
      return Hyphen2FAStatusType.PENDING;
    case 'approved':
      return Hyphen2FAStatusType.APPROVED;
    case 'denied':
      return Hyphen2FAStatusType.DENIED;
    default:
      throw ArgumentError('Invalid Hyphen2FAStatusType value: $json');
  }
}
