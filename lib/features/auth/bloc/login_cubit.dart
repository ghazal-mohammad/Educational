import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({required this.authRepository}) : super(const LoginState.initial());

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Validate phone number with regex pattern (09XXXXXXXX)
  bool _validatePhoneNumber(String phone) {
    final regex = RegExp(r'^09\d{8}$');
    return regex.hasMatch(phone);
  }

  /// Get OTP - validates and submits phone number
  Future<void> getOtp() async {
    final phone = phoneController.text.trim();

    // 1. Validate phone number
    if (phone.isEmpty || !_validatePhoneNumber(phone)) {
      emit(const LoginState.error('Phone number must match 09XXXXXXXX'));
      return;
    }

    emit(const LoginState.loading());
    
    // 2. Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // 3. MOCK: Return fake success for testing UI/navigation flow
    //    When real API is ready, replace with the commented code below
    emit(LoginState.success(
      otpId: 'fake_id_${phone}_${DateTime.now().millisecondsSinceEpoch}',
      phone: phone,
    ));

    /* REAL API CODE (for when backend is ready):
    try {
      final response = await authRepository.requestOtp(phone);
      
      if (response.success && response.otp != null) {
        emit(LoginState.success(
          otpId: response.otp!.otpId,
          phone: phone,
        ));
      } else {
        emit(LoginState.error(response.message));
      }
    } catch (e) {
      emit(LoginState.error('Failed to get OTP: ${e.toString()}'));
    }
    */
  }

  /// Clear error state
  void clearError() {
    if (state is ErrorState) {
      emit(const LoginState.initial());
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}
