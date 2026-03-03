// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_model.freezed.dart';
part 'otp_model.g.dart';

@freezed
class OtpModel with _$OtpModel {
  const factory OtpModel({
    @Default('') String otpId,
    @Default('') String phone,
    @Default(300) int expiresIn,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime createdAt,
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);
}

DateTime _dateTimeFromJson(dynamic value) {
  if (value == null) return DateTime.now();
  if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
  return DateTime.now();
}

String _dateTimeToJson(DateTime value) => value.toIso8601String();