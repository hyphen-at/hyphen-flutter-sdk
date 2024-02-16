import 'package:json_annotation/json_annotation.dart';

part 'flow_transaction_request.g.dart';

@JsonSerializable()
class FlowTransactionRequest {
  final List<String> arguments;
  final List<String> authorizers;

  @JsonKey(name: 'envelope_signatures')
  final List<Signature> envelopeSignatures;

  @JsonKey(name: 'gas_limit')
  final String gasLimit;

  final String payer;

  @JsonKey(name: 'payload_signatures')
  final List<Signature> payloadSignatures;

  @JsonKey(name: 'proposal_key')
  final ProposalKey proposalKey;

  @JsonKey(name: 'reference_block_id')
  final String referenceBlockID;

  final String script;

  FlowTransactionRequest({
    required this.arguments,
    required this.authorizers,
    required this.envelopeSignatures,
    required this.gasLimit,
    required this.payer,
    required this.payloadSignatures,
    required this.proposalKey,
    required this.referenceBlockID,
    required this.script,
  });

  factory FlowTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$FlowTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FlowTransactionRequestToJson(this);
}

@JsonSerializable()
class Signature {
  final String address;

  @JsonKey(name: 'key_index')
  final String keyIndex;

  final String signature;

  Signature({
    required this.address,
    required this.keyIndex,
    required this.signature,
  });

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}

@JsonSerializable()
class ProposalKey {
  final String address;

  @JsonKey(name: 'key_index')
  final String keyIndex;

  @JsonKey(name: 'sequence_number')
  final String sequenceNumber;

  ProposalKey({
    required this.address,
    required this.keyIndex,
    required this.sequenceNumber,
  });

  factory ProposalKey.fromJson(Map<String, dynamic> json) =>
      _$ProposalKeyFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalKeyToJson(this);
}
