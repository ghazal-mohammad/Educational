import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class SubmitOtpState {}
class InitialState extends SubmitOtpState {}
class LoadingState extends SubmitOtpState {}
class SuccessState extends SubmitOtpState {}
class ErrorState extends SubmitOtpState { final String message; ErrorState(this.message); }

class SubmitOtpCubit extends Cubit<SubmitOtpState> {
  SubmitOtpCubit() : super(InitialState());

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
        int minutes = _start ~/ 60;
        int seconds = _start % 60;
        timerText = "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        emit(InitialState());
      }
    });
  }

  Future<void> verifyOtp({required String otpId, required String phone}) async {
    final code = otpController.text.trim();

    if (code.length != 4) {
      emit(ErrorState('OTP must be 4 digits'));
      return;
    }

    emit(LoadingState());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(SuccessState());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    otpController.dispose();
    return super.close();
  }
}
