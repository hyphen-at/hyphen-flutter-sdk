import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_retry_2fa.g.dart';

@JsonSerializable()
class HyphenRequestRetry2FA {
  final String destDeviceId;

  HyphenRequestRetry2FA({
    required this.destDeviceId,
  });

  factory HyphenRequestRetry2FA.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestRetry2FAFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestRetry2FAToJson(this);
}
