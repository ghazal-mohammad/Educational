import '../../data/models/otp_response_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../../../global/networking/result_freezed.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;

  const VerifyOtpUseCase(this._repository);

  Future<Result<OtpResponseModel>> call({
    required String otpId,
    required String phone,
    required String code,
  }) {
    return _repository.verifyOtp(
      otpId: otpId,
      phone: phone,
      code: code,
    );
  }
}

