// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenTransaction _$HyphenTransactionFromJson(Map<String, dynamic> json) =>
    HyphenTransaction(
      id: json['id'] as String,
      chainName: json['chainName'] as String,
      refUrl: json['refUrl'] as String,
    );

Map<String, dynamic> _$HyphenTransactionToJson(HyphenTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chainName': instance.chainName,
      'refUrl': instance.refUrl,
    };
