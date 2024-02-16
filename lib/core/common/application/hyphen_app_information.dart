import 'package:json_annotation/json_annotation.dart';

part 'hyphen_app_information.g.dart';

@JsonSerializable()
class HyphenAppInformation {
  final String appId;
  final String appName;

  HyphenAppInformation({
    required this.appId,
    required this.appName,
  });

  factory HyphenAppInformation.fromJson(Map<String, dynamic> json) =>
      _$HyphenAppInformationFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenAppInformationToJson(this);
}
