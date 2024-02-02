import 'package:json_annotation/json_annotation.dart';

part 'hyphen_transaction.g.dart';

@JsonSerializable()
class HyphenTransaction {
  final String id;
  final String chainName;
  final String refUrl;

  HyphenTransaction({
    required this.id,
    required this.chainName,
    required this.refUrl,
  });

  factory HyphenTransaction.fromJson(Map<String, dynamic> json) =>
      _$HyphenTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$HyphenTransactionToJson(this);
}
