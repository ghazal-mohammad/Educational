import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart' as level;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'global/bloc/theme_bloc/theme_bloc.dart';
import 'global/bloc/localization_bloc/localization_cubit.dart';
import 'global/core/app_state.dart';
import 'global/design/themes/themes.dart';
import 'global/networking/dio_helper.dart';
import 'global/utils/di/dependency_injection.dart';
import 'global/utils/helper/shared_prefs.dart';
import 'global/utils/router/app_router.dart';

final GlobalKey<NavigatorState> navigatorTestKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjectionSetup();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await Prefs.init();
  await getIt<AppStateModel>().init();

  // final userInfo = getIt<AppStateModel>().userInfo;
  // if (userInfo != null) {
  //   printSuccess('User token: ${userInfo.token}');
  // }

  EasyLocalization.logger.enableLevels = [level.EasyLogger().enableLevels[3]];

  // Get saved locale before running app
  final savedLocale = getIt<AppStateModel>().locale;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      startLocale: savedLocale,
      fallbackLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = getIt<ThemeBloc>();
    themeBloc.add(const FetchTheme());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<AppStateModel>()),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ThemeBloc>.value(
                  value: getIt<ThemeBloc>(),
                ),
                BlocProvider<LocalizationCubit>.value(
                  value: getIt<LocalizationCubit>(),
                ),
              ],
              child: BlocBuilder<ThemeBloc, ThemeState>(
                bloc: getIt<ThemeBloc>(),
                buildWhen: (previous, current) => current is ThemeFetched,
                builder: (context, themeState) {
                  final themeMode = themeState is ThemeFetched
                      ? themeState.themeMode
                      : ThemeMode.light;
                  final themeData = themeMode == ThemeMode.dark
                      ? AppThemes.dark
                      : AppThemes.light;

                  return BlocBuilder<LocalizationCubit, LocalizationState>(
                    bloc: getIt<LocalizationCubit>(),
                    buildWhen: (previous, current) {
                      return previous.locale != current.locale;
                    },
                    builder: (context, localizationState) {
                      final currentLocale = localizationState.locale;

                      return MaterialApp.router(
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: currentLocale,
                        debugShowCheckedModeBanner: false,
                        theme: themeData,
                        themeMode: themeMode,
                        routerConfig: router,
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
