import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_response_model.freezed.dart';
part 'otp_response_model.g.dart';

@freezed
class OtpResponseModel with _$OtpResponseModel {
  const factory OtpResponseModel({
    @Default(false) bool success,
    @Default('') String message,
    String? token,
    Map<String, dynamic>? user,
  }) = _OtpResponseModel;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelFromJson(json);
}