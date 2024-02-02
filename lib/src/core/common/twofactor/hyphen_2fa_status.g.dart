// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_2fa_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hyphen2FAStatus _$Hyphen2FAStatusFromJson(Map<String, dynamic> json) =>
    Hyphen2FAStatus(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      request:
          Hyphen2FARequest.fromJson(json['request'] as Map<String, dynamic>),
      status: $enumDecode(_$Hyphen2FAStatusTypeEnumMap, json['status']),
      expiresAt: json['expiresAt'] as String,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Hyphen2FAStatusToJson(Hyphen2FAStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'request': instance.request,
      'status': _$Hyphen2FAStatusTypeEnumMap[instance.status]!,
      'expiresAt': instance.expiresAt,
      'result': instance.result,
    };

const _$Hyphen2FAStatusTypeEnumMap = {
  Hyphen2FAStatusType.PENDING: 'pending',
  Hyphen2FAStatusType.APPROVED: 'approved',
  Hyphen2FAStatusType.DENIED: 'denied',
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      txId: json['txId'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'txId': instance.txId,
    };
