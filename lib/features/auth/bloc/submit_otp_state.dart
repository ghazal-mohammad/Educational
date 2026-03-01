
import 'package:flutter/cupertino.dart';

import '../data/models/login_models.dart';

@immutable
class SubmitOtpState {
  final bool isLoading;
  final String? errorMessage;
  final String? token;
  final UserAuthModel? user;
  final int secondsLeft;
  final bool canResend;

  const SubmitOtpState({
    required this.isLoading,
    this.errorMessage,
    this.token,
    this.user,
    this.secondsLeft = 54,
    this.canResend = false,
  });

  const SubmitOtpState.initial()
      : isLoading = false,
        errorMessage = null,
        token = null,
        user = null,
        secondsLeft = 54,
        canResend = false;

  const SubmitOtpState.loading()
      : isLoading = true,
        errorMessage = null,
        token = null,
        user = null,
        secondsLeft = 54,
        canResend = false;

  const SubmitOtpState.success({required this.token, this.user})
      : isLoading = false,
        errorMessage = null,
        secondsLeft = 54,
        canResend = false;

  const SubmitOtpState.error(String message, {int? secondsLeft, bool? canResend})
      : isLoading = false,
        errorMessage = message,
        token = null,
        user = null,
        secondsLeft = secondsLeft ?? 54,
        canResend = canResend ?? false;

  SubmitOtpState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? token,
    UserAuthModel? user,
    int? secondsLeft,
    bool? canResend,
  }) {
    return SubmitOtpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      token: token ?? this.token,
      user: user ?? this.user,
      secondsLeft: secondsLeft ?? this.secondsLeft,
      canResend: canResend ?? this.canResend,
    );
  }
}