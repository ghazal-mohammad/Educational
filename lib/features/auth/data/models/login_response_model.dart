import 'package:freezed_annotation/freezed_annotation.dart';
import 'otp_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @Default(false) bool success,
    @Default('') String message,
    String? token,
    OtpModel? otp,
    Map<String, dynamic>? user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}