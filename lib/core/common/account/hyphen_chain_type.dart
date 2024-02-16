import 'package:json_annotation/json_annotation.dart';

enum HyphenChainType {
  @JsonValue("evm")
  EVM,

  @JsonValue("cadence")
  CADENCE,

  @JsonValue("sealevel")
  SEALEVEL,

  @JsonValue("movevm")
  MOVEVM,
}

String _$HyphenChainTypeToJson(HyphenChainType chainType) {
  switch (chainType) {
    case HyphenChainType.EVM:
      return 'evm';
    case HyphenChainType.CADENCE:
      return 'cadence';
    case HyphenChainType.SEALEVEL:
      return 'sealevel';
    case HyphenChainType.MOVEVM:
      return 'movevm';
  }
}

HyphenChainType _$HyphenChainTypeFromJson(String json) {
  switch (json) {
    case 'evm':
      return HyphenChainType.EVM;
    case 'cadence':
      return HyphenChainType.CADENCE;
    case 'sealevel':
      return HyphenChainType.SEALEVEL;
    case 'movevm':
      return HyphenChainType.MOVEVM;
    default:
      throw ArgumentError('Invalid HyphenChainType value: $json');
  }
}
