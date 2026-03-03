import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../submit_otp_state.dart';

class SubmitOtpCubit extends Cubit<SubmitOtpState> {
  SubmitOtpCubit() : super(const SubmitOtpState.initial());

  final TextEditingController otpController = TextEditingController();

  Timer? _timer;
  int _start = 60;
  String timerText = "01:00";

  void startTimer() {
    _start = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        _start--;
        final minutes = _start ~/ 60;
        final seconds = _start % 60;
        timerText =
            "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        emit(const SubmitOtpState.initial());
      }
    });
  }

  Future<void> verifyOtp({required String otpId, required String phone}) async {
    final code = otpController.text.trim();

    if (code.length != 4) {
      emit(const SubmitOtpState.error('OTP must be 4 digits'));
      return;
    }

    emit(const SubmitOtpState.loading());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(const SubmitOtpState.success(token: 'mock-token'));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    otpController.dispose();
    return super.close();
  }
}

