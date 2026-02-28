import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/global/design/common_sizes.dart';

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
      _NavItem('Profile', 'assets/icons/profile.svg'),
    ];

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.10), // glass
                borderRadius: BorderRadius.circular(32.r),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  static const Color _purple = Color(0xFF331E53);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(23.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0x80B7A4C6) : Colors.transparent,
          borderRadius: BorderRadius.circular(23.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item.asset,
              width: selected ? 14.w : 18.w,
              height: selected ? 16.h : 18.h,
              colorFilter: ColorFilter.mode(
                selected ? _purple : _purple.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
            ),
            CommonSizes(height: selected ? 2.h : 0),

            // ✅ النص يظهر فقط للعنصر المحدد مثل الصورة + بدون overflow
            if (selected)
              CommonSizes(
                height: 15.h,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    item.label,
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _purple,
                      height: 1,
                    ),
                  ),
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
