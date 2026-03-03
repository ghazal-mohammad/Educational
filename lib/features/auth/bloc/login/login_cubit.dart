import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request_model.dart';
import '../../domain/usecases/request_otp_usecase.dart';
import '../login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final RequestOtpUseCase _requestOtp;

  LoginCubit(this._requestOtp) : super(const LoginState.initial());

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool _validatePhoneNumber(String phone) {
    final regex = RegExp(r'^9\d{8}$');
    return regex.hasMatch(phone);
  }

  Future<void> getOtp() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || !_validatePhoneNumber(phone)) {
      emit(const LoginState.error(
          'Please enter a valid Syrian mobile number: 9XXXXXXXX'));
      return;
    }

    emit(const LoginState.loading());

    final request = LoginRequestModel(phone: '+963$phone');
    final result = await _requestOtp(request);

    result.when(
      success: (response) {
        // لما يصير في OTP حقيقي، بنقرأه من response.otp
        final otpId =
            response.otp?.otpId ?? 'fake_id_${phone}_${DateTime.now().millisecondsSinceEpoch}';

        emit(LoginState.success(
          otpId: otpId,
          phone: '+963$phone',
        ));
      },
      failure: (error) {
        emit(LoginState.error(error.message));
      },
    );
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

