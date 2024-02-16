import 'package:json_annotation/json_annotation.dart';

part 'hyphen_sign_result.g.dart';

@JsonSerializable()
class HyphenSignResult {
  final Signature signature;

  HyphenSignResult({required this.signature});

  factory HyphenSignResult.fromJson(Map<String, dynamic> json) =>
      _$HyphenSignResultFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenSignResultToJson(this);
}

@JsonSerializable()
class Signature {
  final String addr;
  final int keyId;
  final String signature;

  Signature({
    required this.addr,
    required this.keyId,
    required this.signature,
  });

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}
