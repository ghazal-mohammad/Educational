// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lms/main.dart';
import '../../core/app_state.dart';
import '../../utils/di/dependency_injection.dart';
import '../../utils/helper/local_storage_helper.dart';
import '../../utils/helper/console_logger.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState.initial()) {
    printSuccess('LocalizationCubit: Constructor called');
    fetchLocalization();
  }

  @override
  Future<void> close() {
    printError('LocalizationCubit: close() called - Cubit is being closed!');
    return super.close();
  }

  Future<void> fetchLocalization() async {
    final locale = await LocalStorageHelper.getLocale();
    await _setLocale(locale, null);
  }

  Future<void> setEnglish(BuildContext context) async {
    printSuccess('LocalizationCubit: setEnglish called');
    await _setLocale(const Locale('en'), context);
  }

  Future<void> setArabic(BuildContext context) async {
    printSuccess('LocalizationCubit: setArabic called');
    await _setLocale(const Locale('ar'), context);
  }

  Future<void> _setLocale(Locale locale, BuildContext? context) async {
    try {
      if (isClosed) return;

      final currentLocale = state.locale;
      if (currentLocale.languageCode == locale.languageCode &&
          !state.isLoading) {
        return;
      }

      emit(LocalizationState.loading(locale));

      await LocalStorageHelper.setLocale(locale);

      if (isClosed) return;

      await Jiffy.setLocale(locale.languageCode);

      if (isClosed) return;

      getIt<AppStateModel>().setLocale(locale);

      BuildContext? contextToUse = context ?? navigatorTestKey.currentContext;

      if (contextToUse != null && contextToUse.mounted) {
        await contextToUse.setLocale(locale);
      }

      if (isClosed) return;

      emit(LocalizationState.fetched(locale));
    } catch (e) {
      printError('LocalizationCubit._setLocale: Error occurred: $e');
      if (!isClosed) {
        emit(LocalizationState.fetched(locale));
      }
    }
  }
}
