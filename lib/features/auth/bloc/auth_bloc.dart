// lib/features/auth/presentation/bloc/auth_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms/features/auth/data/repo/auth_repository.dart';
import 'package:lms/features/auth/data/model/test_auth.dart' hide AuthRepository; // موديلك

// 👈 ملفات part - مهم جداً ترتيبهم هكذا
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const Initial()) {
    on<GetTestAuthKey>(_onGetTestAuthKey);
  }

  Future<void> _onGetTestAuthKey(
    GetTestAuthKey event,
    Emitter<AuthState> emit,
  ) async {
    print('🟡 AuthBloc: Loading started');

    emit(const Loading());

    final result = await authRepository.getTestAuthKey();

    result.when(
      success: (testAuth) {
        // if (testAuth.status == true) {
        //   emit(Success(testAuth));
        // } else {
        //   emit(Error(testAuth.message ?? 'فشل غير معروف'));
        // }
      },
      failure: (error) {
        emit(Error(error.toString()));
      },
    );
  }
}
