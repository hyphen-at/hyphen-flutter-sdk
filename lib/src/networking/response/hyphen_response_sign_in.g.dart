// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyphen_response_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HyphenResponseSignIn _$HyphenResponseSignInFromJson(
        Map<String, dynamic> json) =>
    HyphenResponseSignIn(
      account: HyphenAccount.fromJson(json['account'] as Map<String, dynamic>),
      credentials: HyphenCredential.fromJson(
          json['credentials'] as Map<String, dynamic>),
      transaction: json['transaction'] == null
          ? null
          : HyphenTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HyphenResponseSignInToJson(
        HyphenResponseSignIn instance) =>
    <String, dynamic>{
      'account': instance.account,
      'credentials': instance.credentials,
      'transaction': instance.transaction,
    };
