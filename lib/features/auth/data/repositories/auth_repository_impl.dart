import 'package:lms/global/networking/result_freezed.dart';

import '../../../../global/networking/dio_helper.dart';
import '../../../../global/utils/consts/urls.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/otp_response_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<Result<LoginResponseModel>> requestOtp(
      LoginRequestModel request) async {
    // TODO: استخدم DioHelper.postModel مع Urls.authLogin لما يكون الـ API جاهز
    // حالياً: محاكاة نفس اللي كنا نعمله بالـ cubit (mock) لكن ضمن Repository
    final mockResponse = LoginResponseModel(
      success: true,
      message: 'OTP sent successfully',
      otp: null,
      token: null,
      user: null,
    );

    return Result.success(mockResponse);
  }

  @override
  Future<Result<OtpResponseModel>> verifyOtp({
    required String otpId,
    required String phone,
    required String code,
  }) async {
    // TODO: استخدم DioHelper.postModel مع Urls.verifyOtp لما يكون الـ API جاهز
    // حالياً: محاكاة نجاح بسيط
    const mockResponse = OtpResponseModel(
      success: true,
      message: 'Verified successfully',
      token: 'mock-token',
      user: null,
    );

    return const Result.success(mockResponse);
  }
}

