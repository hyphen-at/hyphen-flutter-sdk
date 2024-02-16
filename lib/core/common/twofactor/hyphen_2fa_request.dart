import 'package:hyphen_flutter_sdk/core/common/application/hyphen_app_information.dart';
import 'package:hyphen_flutter_sdk/core/common/device/hyphen_device.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hyphen_2fa_request.g.dart';

@JsonSerializable()
class Hyphen2FARequest {
  final String id;
  final HyphenAppInformation app;
  final Hyphen2FAUserOpInfo userOpInfo;
  final HyphenDevice srcDevice;
  final HyphenDevice destDevice;
  final String requestedAt;
  final String message;

  Hyphen2FARequest({
    required this.id,
    required this.app,
    required this.userOpInfo,
    required this.srcDevice,
    required this.destDevice,
    required this.requestedAt,
    required this.message,
  });

  factory Hyphen2FARequest.fromJson(Map<String, dynamic> json) =>
      _$Hyphen2FARequestFromJson(json);

  Map<String, dynamic> toJson() => _$Hyphen2FARequestToJson(this);
}

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
