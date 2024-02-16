import 'package:hyphen_flutter_sdk/core/common/key/hyphen_user_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_sign_up.g.dart';

@JsonSerializable()
class HyphenRequestSignUp {
  final String method;
  final String token;
  final String chainName;
  final HyphenUserKey userKey;

  HyphenRequestSignUp({
    required this.method,
    required this.token,
    required this.chainName,
    required this.userKey,
  });

  factory HyphenRequestSignUp.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestSignUpToJson(this);
}
