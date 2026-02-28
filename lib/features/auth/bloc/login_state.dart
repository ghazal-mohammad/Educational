part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();

  const factory LoginState.initial() = InitialState;
  const factory LoginState.loading() = LoadingState;
  const factory LoginState.success({
    required String otpId,
    required String phone,
  }) = SuccessState;
  const factory LoginState.error(String message) = ErrorState;
}

class InitialState extends LoginState {
  const InitialState();
}

class LoadingState extends LoginState {
  const LoadingState();
}

class SuccessState extends LoginState {
  final String otpId;
  final String phone;

  const SuccessState({
    required this.otpId,
    required this.phone,
  });
}

class ErrorState extends LoginState {
  final String message;

  const ErrorState(this.message);
}
