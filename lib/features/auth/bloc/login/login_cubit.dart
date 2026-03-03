import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // final AuthRepository authRepository;

  LoginCubit() : super(const LoginState.initial());

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool _validatePhoneNumber(String phone) {
    final regex = RegExp(r'^9\d{8}$');
    return regex.hasMatch(phone);
  }

  Future<void> getOtp() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || !_validatePhoneNumber(phone)) {
      emit(const LoginState.error('Please enter a valid 9-digit mobile number'));
      return;
    }

    emit(const LoginState.loading());

    await Future.delayed(const Duration(seconds: 1));

    emit(LoginState.success(
      otpId: 'fake_id_${phone}_${DateTime.now().millisecondsSinceEpoch}',
      phone: '+963$phone',
    ));
  }

  void clearError() {
    state.maybeWhen(
      error: (_) => emit(const LoginState.initial()),
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}

