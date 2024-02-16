import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_2fa_approve.g.dart';

@JsonSerializable()
class HyphenRequest2FAApprove {
  final String txId;

  HyphenRequest2FAApprove({
    required this.txId,
  });

  factory HyphenRequest2FAApprove.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequest2FAApproveFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequest2FAApproveToJson(this);
}
