import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/components/course_card.dart';
import 'package:lms/global/design/common_sizes.dart';

const Color _purple = Color(0xFF331E53);
const Color _border = Color(0xFFB7A4C6);
const Color _textColor = Color(0xFF574C69);

class QuickActionCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value1;
  final String value2;

  final VoidCallback? onTap;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value1,
    this.onTap,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: 114.h,
      width: 114.w,
      backgroundColor: _border.withValues(alpha: 0.2),
      borderRadius: 18.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              _purple,
              BlendMode.srcIn,
            ),
          ),
          CommonSizes(height: 10.h),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: _purple,
            ),
          ),
          CommonSizes(height: 4.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value1,
                  style: TextStyle(
                    color: const Color(0xFF00C2AC),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                    text: value2,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _textColor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
