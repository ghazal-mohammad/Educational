import 'package:lms/features/auth/data/models/login_request_model.dart';
import 'package:lms/features/auth/data/models/login_response_model.dart';
import 'package:lms/features/auth/data/models/otp_model.dart';
import 'package:lms/global/networking/dio_helper.dart';
import 'package:lms/global/networking/result_freezed.dart';
import 'package:lms/global/utils/consts/urls.dart';

/// Mock mode flag - set to false to use real API
const bool useMockData = true;

class RequestOtpUseCase {
  Future<Result<LoginResponseModel>> call(LoginRequestModel request) async {
    // Mock mode - return fake data
    if (useMockData) {
      await Future.delayed(const Duration(milliseconds: 800));

      final mockOtpId = 'mock_otp_${DateTime.now().millisecondsSinceEpoch}';

      return Result.success(LoginResponseModel(
        success: true,
        message: 'OTP sent successfully (Mock)',
        otp: OtpModel(
          otpId: mockOtpId,
          phone: request.phone,
          expiresIn: 300,
          createdAt: DateTime.now(),
        ),
        token: null,
      ));
    }

    // Real API call
    return await DioHelper.postModel<LoginResponseModel>(
      Urls.requestOtp,
      request,
      fromJson: LoginResponseModel.fromJson,
    );
  }
}
