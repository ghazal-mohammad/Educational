// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpResponseModelImpl _$$OtpResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpResponseModelImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String?,
      user: json['user'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OtpResponseModelImplToJson(
        _$OtpResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
