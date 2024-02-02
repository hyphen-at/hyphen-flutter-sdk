// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_account_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenAccountAddress _$HyphenAccountAddressFromJson(
        Map<String, dynamic> json) =>
    HyphenAccountAddress(
      chainName: json['chainName'] as String,
      chainId: json['chainId'] as int?,
      chainType: $enumDecode(_$HyphenChainTypeEnumMap, json['chainType']),
      address: json['address'] as String,
      domainName: json['domainName'] as String?,
    );

Map<String, dynamic> _$HyphenAccountAddressToJson(
        HyphenAccountAddress instance) =>
    <String, dynamic>{
      'chainName': instance.chainName,
      'chainId': instance.chainId,
      'chainType': _$HyphenChainTypeEnumMap[instance.chainType]!,
      'address': instance.address,
      'domainName': instance.domainName,
    };

const _$HyphenChainTypeEnumMap = {
  HyphenChainType.EVM: 'evm',
  HyphenChainType.CADENCE: 'cadence',
  HyphenChainType.SEALEVEL: 'sealevel',
  HyphenChainType.MOVEVM: 'movevm',
};
