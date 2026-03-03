import 'package:get_it/get_it.dart';
import 'package:lms/global/networking/dio_helper.dart';

import '../../../features/auth/bloc/login/login_cubit.dart';
import '../../../features/auth/bloc/otp/submit_otp_cubit.dart';
import '../../../features/auth/data/repositories/auth_repository.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/domain/usecases/request_otp_usecase.dart';
import '../../../features/auth/domain/usecases/verify_otp_usecase.dart';
import '../../bloc/localization_bloc/localization_cubit.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';
import '../../core/app_state.dart';

final getIt = GetIt.instance;

void dependencyInjectionSetup() {
  DioHelper.init();

  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  /// Setting Blocs
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());

  /// Providers setup
  getIt.registerLazySingleton<AppStateModel>(() => AppStateModel());

  /// Auth layer
  getIt.registerLazySingleton<AuthRepository>(() => const AuthRepositoryImpl());

  getIt.registerLazySingleton<RequestOtpUseCase>(
      () => RequestOtpUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(getIt<AuthRepository>()));

  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<RequestOtpUseCase>()));

  getIt.registerFactory<SubmitOtpCubit>(
      () => SubmitOtpCubit(getIt<VerifyOtpUseCase>()));
}
