import 'package:json_annotation/json_annotation.dart';

part 'hyphen_2fa_user_op_info.g.dart';

@JsonSerializable()
class Hyphen2FAUserOpInfo {
  final String type;
  final SignIn signIn;

  Hyphen2FAUserOpInfo({
    required this.type,
    required this.signIn,
  });

  factory Hyphen2FAUserOpInfo.fromJson(Map<String, dynamic> json) =>
      _$Hyphen2FAUserOpInfoFromJson(json);

  Map<String, dynamic> toJson() => _$Hyphen2FAUserOpInfoToJson(this);
}

@JsonSerializable()
class SignIn {
  final String location;
  final String ip;
  final String email;

  SignIn({
    required this.location,
    required this.ip,
    required this.email,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
