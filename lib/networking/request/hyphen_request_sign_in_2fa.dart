import 'package:hyphen_flutter_sdk/core/common/key/hyphen_user_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_sign_in_2fa.g.dart';

@JsonSerializable()
class HyphenRequestSignIn2FA {
  final Request request;
  final HyphenUserKey userKey;

  HyphenRequestSignIn2FA({
    required this.request,
    required this.userKey,
  });

  factory HyphenRequestSignIn2FA.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestSignIn2FAFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestSignIn2FAToJson(this);
}

@JsonSerializable()
class Request {
  final String method;
  final String token;
  final String chainName;

  Request({
    required this.method,
    required this.token,
    required this.chainName,
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
