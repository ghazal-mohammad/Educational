import 'package:flutter/material.dart';

import '../color_app.dart';

class AppColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: ColorManager.primaryColor,
    secondary: ColorManager.secondaryColor,
    inversePrimary: ColorManager.thirdBlueColor,
    surface: ColorManager.scaffoldLight,
    error: ColorManager.red,
    onPrimary: ColorManager.pureWhite,
    onSecondary: ColorManager.pureWhite,
    onSurface: ColorManager.textLight,
    onError: ColorManager.pureWhite,
    primaryContainer: ColorManager.normalTextLight,
    onPrimaryFixed: ColorManager.secondaryBlue,
    onSecondaryFixed: ColorManager.lighterGrey,
    onInverseSurface: ColorManager.primaryIconColor,
    onTertiary: ColorManager.textGrey,
    tertiary: ColorManager.disableGrey,
    surfaceContainer: ColorManager.disableGreyButton,
    primaryFixed: ColorManager.navyBlue,
    scrim: ColorManager.hintGrey,
    onPrimaryContainer: ColorManager.lightGreenApp,
    tertiaryContainer: ColorManager.textDark,
    outline: ColorManager.secondaryTextColor,
    secondaryContainer: ColorManager.primaryGreyText,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorManager.primaryColor,
    inversePrimary: ColorManager.thirdBlueColor,
    secondary: ColorManager.secondaryColor,
    surface: ColorManager.scaffoldDark,
    error: ColorManager.red,
    onPrimary: ColorManager.pureBlack,
    onSecondary: ColorManager.pureBlack,
    onSurface: ColorManager.scaffoldLight,
    onError: ColorManager.pureWhite,
    primaryContainer: ColorManager.scaffoldDark,
    onPrimaryFixed: ColorManager.secondaryBlue,
    onSecondaryFixed: ColorManager.lighterGrey,
    onInverseSurface: ColorManager.primaryIconColor,
    onTertiary: ColorManager.textGrey,
    tertiary: ColorManager.disableGrey,
    surfaceContainer: ColorManager.disableGreyButton,
    primaryFixed: ColorManager.navyBlue,
    scrim: ColorManager.hintGrey,
    onPrimaryContainer: ColorManager.lightGreenApp,
    outline: ColorManager.secondaryTextColor,
    tertiaryContainer: ColorManager.textDark,
    secondaryContainer: ColorManager.primaryGreyText,
  );
}

