import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_2fa_finish.g.dart';

@JsonSerializable()
class HyphenRequest2FAFinish {
  final String twoFactorAuthRequestId;

  HyphenRequest2FAFinish({
    required this.twoFactorAuthRequestId,
  });

  factory HyphenRequest2FAFinish.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequest2FAFinishFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequest2FAFinishToJson(this);
}
