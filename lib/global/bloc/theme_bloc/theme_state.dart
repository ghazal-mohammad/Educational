part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = ThemeInitial;
  const factory ThemeState.fetched(ThemeMode themeMode) = ThemeFetched;
}
