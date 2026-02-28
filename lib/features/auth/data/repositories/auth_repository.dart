import '../models/index.dart';

/// Abstract repository للـ authentication
abstract class AuthRepository {
  /// طلب OTP
  Future<LoginResponseModel> requestOtp(String phone);

  /// التحقق من OTP
  Future<LoginResponseModel> verifyOtp({
    required String otpId,
    required String otp,
  });

  /// تسجيل مستخدم جديد
  Future<LoginResponseModel> register({
    required String phone,
    required String name,
    required String email,
  });

  /// تسجيل الخروج
  Future<void> logout();
}
