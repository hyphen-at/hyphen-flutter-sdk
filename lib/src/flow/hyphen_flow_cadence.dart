import 'package:json_annotation/json_annotation.dart';

part 'hyphen_flow_cadence.g.dart';

@JsonSerializable()
class HyphenFlowCadence {
  final String cadence;

  HyphenFlowCadence({required this.cadence});

  factory HyphenFlowCadence.fromJson(Map<String, dynamic> json) =>
      _$HyphenFlowCadenceFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenFlowCadenceToJson(this);
}
