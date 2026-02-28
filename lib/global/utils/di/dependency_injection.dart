import 'package:get_it/get_it.dart';
import 'package:lms/global/networking/dio_helper.dart';
import '../../bloc/localization_bloc/localization_cubit.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';
import '../../core/app_state.dart';
import '../../../features/auth/bloc/login_cubit.dart';
import '../../../features/auth/bloc/submit_otp_cubit.dart';
import '../../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../../features/auth/data/datasources/auth_remote_data_source_impl.dart';
import '../../../features/auth/data/repositories/auth_repository.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';

final getIt = GetIt.instance;

void dependencyInjectionSetup() {
  DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerLazySingleton<AppStateModel>(() => AppStateModel());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(),
  );


  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  
  getIt.registerFactory<SubmitOtpCubit>(
    () => SubmitOtpCubit(authRepository: getIt<AuthRepository>()),
  );
}