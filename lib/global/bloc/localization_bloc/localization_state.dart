part of 'localization_cubit.dart';

class LocalizationState {
  final Locale locale;
  final bool isLoading;

  const LocalizationState({
    required this.locale,
    this.isLoading = false,
  });

  const LocalizationState.initial()
      : locale = const Locale('en'),
        isLoading = true;

  const LocalizationState.loading(this.locale) : isLoading = true;

  const LocalizationState.fetched(this.locale) : isLoading = false;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalizationState &&
        other.locale == locale &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => locale.hashCode ^ isLoading.hashCode;

  @override
  String toString() =>
      'LocalizationState(locale: ${locale.languageCode}, isLoading: $isLoading)';
}
