import 'package:lms/global/networking/result_freezed.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/otp_response_model.dart';

abstract class AuthRepository {
  Future<Result<LoginResponseModel>> requestOtp(LoginRequestModel request);

  Future<Result<OtpResponseModel>> verifyOtp({
    required String otpId,
    required String phone,
    required String code,
  });
}

