import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  Widget build(BuildContext context) {
    const items = <_NavItem>[
      _NavItem('Home', 'assets/icons/home.svg'),
      _NavItem('Exercises', 'assets/icons/exercise.svg'),
      _NavItem('News', 'assets/icons/news.svg'),
      _NavItem('Library', 'assets/icons/library.svg'),
      _NavItem('Status', 'assets/icons/profile.svg'),
    ];

    // Get bottom safe area padding
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: bottomPadding > 0 ? 4.h : 8.h,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              // Figma: width: 351px, height: 64px
              width: 351.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: ColorManager.pureWhite.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(32.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(items.length, (i) {
                  final selected = i == currentIndex;
                  return _NavButton(
                    item: items[i],
                    selected: selected,
                    onTap: () => onTap(i),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(23.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        // Figma: Selected = 54x34px, Unselected = 52x32px, Padding 8px all sides
        width: selected ? 54.w : 52.w,
        height: selected ? 34.h : 32.h,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: selected
              ? ColorManager.secondaryColor.withValues(alpha: 0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(23.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item.asset,
              width: 14.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(
                selected
                    ? ColorManager.primaryColor
                    : ColorManager.primaryColor.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
            ),
            // Gap: 2px between icon and text
            SizedBox(height: 2.h),
            if (selected)
              Text(
                item.label,
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.primaryColor,
                  height: 1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String asset;
  const _NavItem(this.label, this.asset);
}
