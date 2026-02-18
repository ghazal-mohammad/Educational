import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_app.dart';
import 'app_color_scheme.dart';

abstract class AppThemes {
  static ThemeData get light => _theme(
        brightness: Brightness.light,
        primaryColor: ColorManager.textLight,
        appBarShadowColor: ColorManager.white.withValues(alpha: 0.8),
        primaryIconColor: ColorManager.primaryIconColor,
        colorScheme: AppColorScheme.light,
        appBarColor: ColorManager.scaffoldLight,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorManager.white,
        ),
        scaffoldBackgroundColor: ColorManager.scaffoldLight,
      );

  static ThemeData get dark => _theme(
        brightness: Brightness.dark,
        primaryColor: ColorManager.white,
        primaryIconColor: ColorManager.white,
        appBarShadowColor: ColorManager.softBlack.withValues(alpha: 0.3),
        colorScheme: AppColorScheme.dark,
        appBarColor: ColorManager.softBlack,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorManager.softBlack,
        ),
        scaffoldBackgroundColor: ColorManager.scaffoldDark,
      );

  static ThemeData _theme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required BottomNavigationBarThemeData bottomNavigationBarTheme,
    required Color scaffoldBackgroundColor,
    required Color appBarColor,
    required Color primaryColor,
    required Color primaryIconColor,
    required Color appBarShadowColor,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        shadowColor: appBarShadowColor,
        elevation: 2,
        surfaceTintColor: ColorManager.scaffoldLight,
        iconTheme: IconThemeData(color: primaryIconColor),
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontFamily: "Raleway",
        ),
        backgroundColor: appBarColor,
        foregroundColor: colorScheme.onSurface,
      ),
      iconTheme: IconThemeData(color: primaryIconColor),
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      textTheme: _textTheme(colorScheme),
      fontFamily: "Raleway",
    );
  }

  static TextTheme _textTheme(ColorScheme color) => TextTheme(
      bodyMedium: TextStyle(
        color: color.onSurface,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: color.primaryContainer,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
      labelSmall: TextStyle(
        color: color.onPrimaryFixed,
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
      ),
      headlineLarge: TextStyle(
        color: color.primary,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: color.onSurface,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: color.onPrimaryFixed,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: color.primary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: color.scrim,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: color.onTertiary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      labelMedium: TextStyle(
        color: color.onInverseSurface,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      displayMedium: TextStyle(
        color: color.onSurface,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: color.onSecondaryFixed,
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
      displayLarge: TextStyle(
        color: color.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      ),
      bodyLarge: TextStyle(
        color: color.onInverseSurface,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        color: color.onPrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ));
}

extension Utils on BuildContext {
  // ====== Text Styles ======
  TextStyle get bodyText => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyTextBold => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyTextSmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get buttonText => Theme.of(this).textTheme.labelLarge!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get linkText => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get titlePrimary => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleHint => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleMuted => Theme.of(this).textTheme.titleSmall!;
  TextStyle get titleBold => Theme.of(this).textTheme.titleSmall!;
  TextStyle get captionMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get captionSmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get captionBold => Theme.of(this).textTheme.displayLarge!;

  TextStyle get blueLabelText => TextStyle(
        color: const Color(0xff0066B3),
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
      );

  // ====== Theme Check ======
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;

  // ====== Custom Colors ======
  Color get background =>
      isLightTheme ? ColorManager.scaffoldLight : ColorManager.scaffoldDark;
  Color get backgroundColor =>
      isLightTheme ? ColorManager.white : ColorManager.pureBlack;
  Color get commentCardColor =>
      isLightTheme ? Colors.grey[200]! : const Color(0xFF242424);
  Color get skeletonBaseColor =>
      isLightTheme ? Colors.grey[200]! : Colors.grey[700]!;
  Color get skeletonHighlightColor =>
      isLightTheme ? Colors.grey[100]! : Colors.grey[600]!;
  Color get dividerColor =>
      isLightTheme ? ColorManager.disableGrey : ColorManager.primaryGreyText;

  // ====== Color Scheme Shortcuts ======
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get tertiary => Theme.of(this).colorScheme.inversePrimary;
  Color get textPrimary => Theme.of(this).colorScheme.onSurface;
  Color get textSecondary => Theme.of(this).colorScheme.onTertiary;
  Color get textMuted => Theme.of(this).colorScheme.onSecondaryFixed;
  Color get grey => Theme.of(this).colorScheme.onInverseSurface;
  Color get textDark => Theme.of(this).colorScheme.tertiaryContainer;
  Color get greyButton => Theme.of(this).colorScheme.surfaceContainer;
  Color get white => Theme.of(this).colorScheme.surface;
  Color get black => Theme.of(this).colorScheme.onSurface;
  Color get red => Theme.of(this).colorScheme.error;
  Color get blue => Theme.of(this).colorScheme.onPrimaryFixed;
  Color get green => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get navyBlue => Theme.of(this).colorScheme.primaryFixed;
  Color get softBlack => Theme.of(this).colorScheme.primaryContainer;
  Color get successGreen => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get infoGray => Theme.of(this).colorScheme.onInverseSurface;
  Color get secondaryGrey => Theme.of(this).colorScheme.secondaryContainer;
  Color get fontGray => Theme.of(this).colorScheme.outline;
  Color get blackBlue => ColorManager.blackBlue;
}

