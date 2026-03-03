// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpModelImpl _$$OtpModelImplFromJson(Map<String, dynamic> json) =>
    _$OtpModelImpl(
      otpId: json['otpId'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? 300,
      createdAt: _dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$OtpModelImplToJson(_$OtpModelImpl instance) =>
    <String, dynamic>{
      'otpId': instance.otpId,
      'phone': instance.phone,
      'expiresIn': instance.expiresIn,
      'createdAt': _dateTimeToJson(instance.createdAt),
    };
