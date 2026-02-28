import '../models/index.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> requestOtp(String phone);

  Future<LoginResponseModel> verifyOtp({
    required String otpId,
    required String otp,
  });

  Future<LoginResponseModel> register({
    required String phone,
    required String name,
    required String email,
  });

  Future<void> logout();
}
