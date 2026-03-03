import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_otp_state.freezed.dart';

@freezed
class SubmitOtpState with _$SubmitOtpState {
  const factory SubmitOtpState.initial({
    @Default(false) bool isLoading,
    String? errorMessage,
    String? token,
    Map<String, dynamic>? user,
    @Default(54) int secondsLeft,
    @Default(false) bool canResend,
  }) = _Initial;

  const factory SubmitOtpState.loading({
    @Default(true) bool isLoading,
    String? errorMessage,
    String? token,
    Map<String, dynamic>? user,
    @Default(54) int secondsLeft,
    @Default(false) bool canResend,
  }) = _Loading;

  const factory SubmitOtpState.success({
    required String token,
    Map<String, dynamic>? user,
    @Default(false) bool isLoading,
    @Default(54) int secondsLeft,
    @Default(false) bool canResend,
  }) = _Success;

  const factory SubmitOtpState.error(
    String message, {
    @Default(false) bool isLoading,
    String? token,
    Map<String, dynamic>? user,
    @Default(54) int secondsLeft,
    @Default(false) bool canResend,
  }) = _Error;
}