import 'package:get_it/get_it.dart';
import 'package:lms/features/auth/data/repositories/request_otp_use_case.dart';
import 'package:lms/features/auth/data/repositories/verify_otp_use_case.dart';
import 'package:lms/features/auth/bloc/login/login_cubit.dart';
import 'package:lms/features/auth/bloc/otp/submit_otp_cubit.dart';
import 'package:lms/global/networking/dio_helper.dart';
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

  /// Auth use cases
  getIt.registerLazySingleton<RequestOtpUseCase>(() => RequestOtpUseCase());
  getIt.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase());

  /// Auth cubits
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<RequestOtpUseCase>()));

  getIt.registerFactory<SubmitOtpCubit>(
      () => SubmitOtpCubit(getIt<VerifyOtpUseCase>()));
}
