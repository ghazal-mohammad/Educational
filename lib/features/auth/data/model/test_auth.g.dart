// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestAuthImpl _$$TestAuthImplFromJson(Map<String, dynamic> json) =>
    _$TestAuthImpl(
      authKey: json['auth_key'] as String?,
      sendIn: (json['send_in'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$TestAuthImplToJson(_$TestAuthImpl instance) =>
    <String, dynamic>{
      'auth_key': instance.authKey,
      'send_in': instance.sendIn,
    };

_$SendInImpl _$$SendInImplFromJson(Map<String, dynamic> json) => _$SendInImpl(
      header: json['header'] as String?,
      orQuery: json['or_query'] as String?,
      orBearerToken: json['or_bearer_token'] as String?,
    );

Map<String, dynamic> _$$SendInImplToJson(_$SendInImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'or_query': instance.orQuery,
      'or_bearer_token': instance.orBearerToken,
    };
