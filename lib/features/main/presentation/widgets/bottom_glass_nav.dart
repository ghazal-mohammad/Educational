import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/global/design/color_app.dart';

class BottomGlassNav extends StatelessWidget {
  const BottomGlassNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double _figmaNavWidth = 351.0;
  static const double _figmaNavHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final bottomInset = media.padding.bottom;

    final navWidth = screenWidth - 40.0;
    final navHeight = navWidth * (_figmaNavHeight / _figmaNavWidth);

    double sx(double v) => v * (navWidth / _figmaNavWidth);
    double sy(double v) => v * (navHeight / _figmaNavHeight);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: bottomInset > 0 ? 8 : 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(sy(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            width: navWidth,
            height: navHeight,
            decoration: BoxDecoration(
              color: ColorManager.pureWhite.withValues(alpha: 0.60),
              borderRadius: BorderRadius.circular(sy(32)),
            ),
            child: Stack(
              children: [
                _NavItemWidget(
                  label: 'Home',
                  asset: 'assets/icons/home.svg',
                  isActive: currentIndex == 0,
                  showLabelWhenActive: false,
                  left: sx(9),
                  top: sy(16),
                  width: sx(52),
                  height: sy(34),
                  iconWidth: sx(16),
                  iconHeight: sy(18),
                  radius: sy(23),
                  onTap: () => onTap(0),
                ),
                _NavItemWidget(
                  label: 'Exercises',
                  asset: 'assets/icons/exercise.svg',
                  isActive: currentIndex == 1,
                  showLabelWhenActive: true,
                  left: sx(62),
                  top: sy(7),
                  width: sx(94),
                  height: sy(51),
                  iconWidth: sx(18),
                  iconHeight: sy(18),
                  radius: sy(23),
                  onTap: () => onTap(1),
                ),
                _NavItemWidget(
                  label: 'Library',
                  asset: 'assets/icons/library.svg',
                  isActive: currentIndex == 2,
                  showLabelWhenActive: false,
                  left: sx(159),
                  top: sy(16),
                  width: sx(51),
                  height: sy(34),
                  iconWidth: sx(15),
                  iconHeight: sy(18),
                  radius: sy(23),
                  onTap: () => onTap(2),
                ),
                _NavItemWidget(
                  label: 'News',
                  asset: 'assets/icons/news.svg',
                  isActive: currentIndex == 3,
                  showLabelWhenActive: false,
                  left: sx(220),
                  top: sy(17),
                  width: sx(52),
                  height: sy(32),
                  iconWidth: sx(16),
                  iconHeight: sy(16),
                  radius: sy(23),
                  onTap: () => onTap(3),
                ),
                _NavItemWidget(
                  label: 'Status',
                  asset: 'assets/icons/profile.svg',
                  isActive: currentIndex == 4,
                  showLabelWhenActive: false,
                  left: sx(288),
                  top: sy(15),
                  width: sx(54),
                  height: sy(34),
                  iconWidth: sx(18),
                  iconHeight: sy(18),
                  radius: sy(23),
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget({
    required this.label,
    required this.asset,
    required this.isActive,
    required this.showLabelWhenActive,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.iconWidth,
    required this.iconHeight,
    required this.radius,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool isActive;
  final bool showLabelWhenActive;
  final double left;
  final double top;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;
  final double radius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = ColorManager.textLight;
    final inactiveColor = ColorManager.textLight.withValues(alpha: 0.5);

    final showSelectedStyle = isActive && showLabelWhenActive;

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            decoration: BoxDecoration(
              color: showSelectedStyle
                  ? ColorManager.secondaryColor.withValues(alpha: 0.5)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: showSelectedStyle
                ? _ActiveExerciseContent(
              label: label,
              asset: asset,
              width: width,
              height: height,
              iconWidth: iconWidth,
              iconHeight: iconHeight,
              color: activeColor,
            )
                : Center(
              child: SvgPicture.asset(
                asset,
                width: iconWidth,
                height: iconHeight,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  isActive ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActiveExerciseContent extends StatelessWidget {
  const _ActiveExerciseContent({
    required this.label,
    required this.asset,
    required this.width,
    required this.height,
    required this.iconWidth,
    required this.iconHeight,
    required this.color,
  });

  final String label;
  final String asset;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final labelWidth = width * (58 / 94);
    final iconTop = height * (8 / 51);
    final gap = height * (2 / 51);
    final textTop = iconTop + iconHeight + gap;
    final textHeight = height * (15 / 51);

    return Stack(
      children: [
        Positioned(
          top: iconTop,
          left: (width - iconWidth) / 2,
          child: SvgPicture.asset(
            asset,
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          top: textTop,
          left: (width - labelWidth) / 2,
          width: labelWidth,
          height: textHeight,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.0,
                letterSpacing: 0,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}