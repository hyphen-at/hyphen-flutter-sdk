import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_request.dart';
import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_status_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_2fa_status.g.dart';

@JsonSerializable()
class Hyphen2FAStatus {
  final String id;
  final String accountId;
  final Hyphen2FARequest request;
  @JsonKey(name: 'status')
  final Hyphen2FAStatusType status;
  final String expiresAt;
  final Result? result;

  Hyphen2FAStatus({
    required this.id,
    required this.accountId,
    required this.request,
    required this.status,
    required this.expiresAt,
    this.result,
  });

  factory Hyphen2FAStatus.fromJson(Map<String, dynamic> json) =>
      _$Hyphen2FAStatusFromJson(json);

  Map<String, dynamic> toJson() => _$Hyphen2FAStatusToJson(this);
}

@JsonSerializable()
class Result {
  final String txId;

  Result({
    required this.txId,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
