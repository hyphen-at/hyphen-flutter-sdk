import 'package:json_annotation/json_annotation.dart';

part 'hyphen_request_sign.g.dart';

@JsonSerializable()
class HyphenRequestSign {
  final String message;

  HyphenRequestSign({
    required this.message,
  });

  factory HyphenRequestSign.fromJson(Map<String, dynamic> json) =>
      _$HyphenRequestSignFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenRequestSignToJson(this);
}
