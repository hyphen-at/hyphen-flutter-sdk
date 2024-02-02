import 'package:json_annotation/json_annotation.dart';

part 'hyphen_chain_type.g.dart';

enum HyphenChainType {
  @JsonValue('evm')
  EVM,

  @JsonValue('cadence')
  CADENCE,

  @JsonValue('sealevel')
  SEALEVEL,

  @JsonValue('movevm')
  MOVEVM,
}

HyphenChainType _$HyphenChainTypeFromJson(String value) {
  switch (value) {
    case 'evm':
      return HyphenChainType.EVM;
    case 'cadence':
      return HyphenChainType.CADENCE;
    case 'sealevel':
      return HyphenChainType.SEALEVEL;
    case 'movevm':
      return HyphenChainType.MOVEVM;
    default:
      throw ArgumentError.value(value, 'HyphenChainType');
  }
}

String _$HyphenChainTypeToJson(HyphenChainType instance) =>
    _$HyphenChainTypeToJsonMap[instance];

const _$HyphenChainTypeToJsonMap = {
  HyphenChainType.EVM: 'evm',
  HyphenChainType.CADENCE: 'cadence',
  HyphenChainType.SEALEVEL: 'sealevel',
  HyphenChainType.MOVEVM: 'movevm',
};
