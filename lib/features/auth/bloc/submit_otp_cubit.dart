import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// استيرادات الطبقة الخاصة بالبيانات [217، 384]
import '../auth_constants.dart';
import '../data/repositories/auth_repository.dart';
import '../data/models/index.dart';

part 'submit_otp_state.dart';

class SubmitOtpCubit extends Cubit<SubmitOtpState> {
  final AuthRepository authRepository;

  final TextEditingController otpController = TextEditingController();

  Timer? _timer;
  static const int _initialSeconds = 54;

  SubmitOtpCubit({required this.authRepository})
      : super(const SubmitOtpState.initial()) {
    _startTimer();
  }
  String get timerText => '00:${state.secondsLeft.toString().padLeft(2, "0")}';
  int get secondsLeft => state.secondsLeft;
  bool get canResend => state.canResend;
  bool get isOtpComplete => otpController.text.length == kOtpCodeLength;

  void _startTimer() {
    _timer?.cancel();

    emit(state.copyWith(
      secondsLeft: _initialSeconds,
      canResend: false,
    ));

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final currentSeconds = state.secondsLeft;

      if (currentSeconds <= 1) {
        t.cancel();
        emit(state.copyWith(
          secondsLeft: 0,
          canResend: true,
        ));
      } else {
        emit(state.copyWith(
          secondsLeft: currentSeconds - 1,
          canResend: false,
        ));
      }
    });
  }

  void restartTimer() {
    _startTimer();
  }
  bool _validateOtp(String otp) {
    final pattern = r'^\d{' + kOtpCodeLength.toString() + r'}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(otp);
  }

  Future<void> verifyOtp({required String otpId, required String phone}) async {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please enter OTP'));
      return;
    }

    if (!_validateOtp(otp)) {
      emit(state.copyWith(errorMessage: 'OTP must be $kOtpCodeLength digits'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await authRepository.verifyOtp(otpId: otpId, otp: otp);
      if (response.success && response.token != null) {
        emit(SubmitOtpState.success(token: response.token!, user: response.user));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: response.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Verification failed: ${e.toString()}',
      ));
    }
  }

  void clearError() {
    if (state.errorMessage != null) {
      emit(state.copyWith(errorMessage: null));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    otpController.dispose();
    return super.close();
  }
}