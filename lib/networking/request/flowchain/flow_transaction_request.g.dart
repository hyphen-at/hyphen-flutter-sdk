// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowTransactionRequest _$FlowTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    FlowTransactionRequest(
      arguments:
          (json['arguments'] as List<dynamic>).map((e) => e as String).toList(),
      authorizers: (json['authorizers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      envelopeSignatures: (json['envelope_signatures'] as List<dynamic>)
          .map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
      gasLimit: json['gas_limit'] as String,
      payer: json['payer'] as String,
      payloadSignatures: (json['payload_signatures'] as List<dynamic>)
          .map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
      proposalKey:
          ProposalKey.fromJson(json['proposal_key'] as Map<String, dynamic>),
      referenceBlockID: json['reference_block_id'] as String,
      script: json['script'] as String,
    );

Map<String, dynamic> _$FlowTransactionRequestToJson(
        FlowTransactionRequest instance) =>
    <String, dynamic>{
      'arguments': instance.arguments,
      'authorizers': instance.authorizers,
      'envelope_signatures': instance.envelopeSignatures,
      'gas_limit': instance.gasLimit,
      'payer': instance.payer,
      'payload_signatures': instance.payloadSignatures,
      'proposal_key': instance.proposalKey,
      'reference_block_id': instance.referenceBlockID,
      'script': instance.script,
    };

Signature _$SignatureFromJson(Map<String, dynamic> json) => Signature(
      address: json['address'] as String,
      keyIndex: json['key_index'] as String,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
      'address': instance.address,
      'key_index': instance.keyIndex,
      'signature': instance.signature,
    };

ProposalKey _$ProposalKeyFromJson(Map<String, dynamic> json) => ProposalKey(
      address: json['address'] as String,
      keyIndex: json['key_index'] as String,
      sequenceNumber: json['sequence_number'] as String,
    );

Map<String, dynamic> _$ProposalKeyToJson(ProposalKey instance) =>
    <String, dynamic>{
      'address': instance.address,
      'key_index': instance.keyIndex,
      'sequence_number': instance.sequenceNumber,
    };
