import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../../../global/networking/result_freezed.dart';

class RequestOtpUseCase {
  final AuthRepository _repository;

  const RequestOtpUseCase(this._repository);

  Future<Result<LoginResponseModel>> call(LoginRequestModel request) {
    return _repository.requestOtp(request);
  }
}

