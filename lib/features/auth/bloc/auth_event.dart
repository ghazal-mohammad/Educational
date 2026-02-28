// lib/features/auth/presentation/bloc/auth_event.dart
part of 'auth_bloc.dart';  // 👈 مهم جداً: part of مش import

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.getTestAuthKey() = GetTestAuthKey;
}