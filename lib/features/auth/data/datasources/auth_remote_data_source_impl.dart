import 'package:lms/global/networking/dio_helper.dart';
import 'package:lms/global/utils/consts/urls.dart';

import '../models/index.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginResponseModel> requestOtp(String phone) async {
    try {
      final request = LoginRequestModel(phone: phone);
      
      final result = await DioHelper.postModel<Map<String, dynamic>>(
        Urls.loginUrl,
        request.toJson(),
        fromJson: (json) => json,
      );

      return result.when(
        success: (data) => LoginResponseModel.fromJson(data),
        failure: (failure) => throw Exception(failure.message),
      );
    } catch (e) {
      throw Exception('Failed to request OTP: ${e.toString()}');
    }
  }

  @override
  Future<LoginResponseModel> verifyOtp({
    required String otpId,
    required String otp,
  }) async {
    try {
      final result = await DioHelper.postModel<Map<String, dynamic>>(
        Urls.verifyOtpUrl,
        {
          'otpId': otpId,
          'otp': otp,
        },
        fromJson: (json) => json,
      );

      return result.when(
        success: (data) => LoginResponseModel.fromJson(data),
        failure: (failure) => throw Exception(failure.message),
      );
    } catch (e) {
      throw Exception('Failed to verify OTP: ${e.toString()}');
    }
  }

  @override
  Future<LoginResponseModel> register({
    required String phone,
    required String name,
    required String email,
  }) async {
    try {
      final result = await DioHelper.postModel<Map<String, dynamic>>(
        Urls.registerUrl,
        {
          'phone': phone,
          'name': name,
          'email': email,
        },
        fromJson: (json) => json,
      );

      return result.when(
        success: (data) => LoginResponseModel.fromJson(data),
        failure: (failure) => throw Exception(failure.message),
      );
    } catch (e) {
      throw Exception('Failed to register: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await DioHelper.postModel<Map<String, dynamic>>(
        Urls.logoutUrl,
        {},
        fromJson: (json) => json,
      );
    } catch (e) {
      throw Exception('Failed to logout: ${e.toString()}');
    }
  }
}
