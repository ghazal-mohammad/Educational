import '../datasources/index.dart';
import '../models/index.dart';
import 'auth_repository.dart';

/// تطبيق الـ authentication repository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<LoginResponseModel> requestOtp(String phone) async {
    try {
      return await remoteDataSource.requestOtp(phone);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> verifyOtp({
    required String otpId,
    required String otp,
  }) async {
    try {
      return await remoteDataSource.verifyOtp(
        otpId: otpId,
        otp: otp,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> register({
    required String phone,
    required String name,
    required String email,
  }) async {
    try {
      return await remoteDataSource.register(
        phone: phone,
        name: name,
        email: email,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
    } catch (e) {
      rethrow;
    }
  }
}
