import 'package:get_it/get_it.dart';
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

  /// Repositories
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  /// Providers setup
  getIt.registerLazySingleton<AppStateModel>(() => AppStateModel());

  /// Auth Bloc
  // getIt.registerLazySingleton<LoginCubit>(
  //     () => LoginCubit(getIt<AuthRepository>()));
  // getIt.registerLazySingleton<RegisterCubit>(
  //     () => RegisterCubit(getIt<AuthRepository>()));
}
