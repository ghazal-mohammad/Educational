// lib/features/auth/presentation/bloc/auth_state.dart
part of 'auth_bloc.dart';  // 👈 مهم جداً: part of مش import

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(TestAuth data) = Success;
  const factory AuthState.error(String message) = Error;
}