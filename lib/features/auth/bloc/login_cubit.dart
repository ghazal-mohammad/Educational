import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // final AuthRepository authRepository;
  // final  authRepository;

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
      if (phone.isEmpty || !_validatePhoneNumber(phone)) {
        emit(const LoginState.error('Please enter a valid 9-digit mobile number'));
        return;
      }      return;
    }

    emit(const LoginState.loading());

    await Future.delayed(const Duration(seconds: 1));

    //  MOCK: نجاح وهمي لغرض فحص التنقل (Navigation)
    // عند جهوزية الـ API الحقيقي، يتم إلغاء التعليق عن الكود أدناه
    emit(LoginState.success(
      otpId: 'fake_id_${phone}_${DateTime.now().millisecondsSinceEpoch}',
      phone: '+963$phone',
    ));

    /* كود الـ API الحقيقي (عند توفر الربط):
    try {
      final response = await authRepository.requestOtp('+963$phone');

      if (response.success && response.otp != null) {
        emit(LoginState.success(
          otpId: response.otp!.otpId,
          phone: '+963$phone',
        ));
      } else {
        emit(LoginState.error(response.message));
      }
    } catch (e) {
      emit(LoginState.error('فشل في طلب الرمز: ${e.toString()}'));
    }
    */
  }

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