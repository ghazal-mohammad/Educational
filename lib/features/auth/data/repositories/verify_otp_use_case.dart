import 'package:lms/features/auth/data/models/otp_response_model.dart';
import 'package:lms/global/networking/dio_helper.dart';
import 'package:lms/global/networking/failure.dart';
import 'package:lms/global/networking/result_freezed.dart';
import 'package:lms/global/utils/consts/urls.dart';

/// Mock mode flag - set to false to use real API
const bool useMockVerifyData = true;

class VerifyOtpUseCase {
  Future<Result<OtpResponseModel>> call({
    required String otpId,
    required String phone,
    required String code,
  }) async {
    // Mock mode - return fake data
    if (useMockVerifyData) {
      await Future.delayed(const Duration(milliseconds: 800));

      // Accept any 4-digit code in mock mode
      if (code.length == 4) {
        return Result.success(OtpResponseModel(
          success: true,
          message: 'Verified successfully (Mock)',
          token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
          user: {
            'id': 1,
            'phone': phone,
            'name': 'Test User',
          },
        ));
      } else {
        return Result.failure(
          ServerError('Invalid OTP code'),
        );
      }
    }

    // Real API call
    return await DioHelper.postModel<OtpResponseModel>(
      Urls.verifyOtp,
      {
        'otp_id': otpId,
        'phone': phone,
        'code': code,
      },
      fromJson: OtpResponseModel.fromJson,
    );
  }
}
