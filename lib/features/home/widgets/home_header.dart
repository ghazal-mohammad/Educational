import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _bg = Color(0xFFFCF8FF);
const Color _purple = Color(0xFF331E53);
const Color _muted = Color(0xFF806D95);
const Color _textColor = Color(0xFF574C69);

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonSizes(height: 4),
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.frame,
              height: 23.68.h,
              width: 21.w,
            ),
            const CommonSizes(width: 3),
            Text(
              'Nucleus',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: _purple),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: _purple.withOpacity(0.17),
              child: SvgPicture.asset(AppAssets.notificationicon,
                  width: 15.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(_muted, BlendMode.srcIn)),
            ),
            const CommonSizes(width: 6),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: _purple.withOpacity(0.17),
              child: SvgPicture.asset(AppAssets.carticon,
                  width: 16.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(_muted, BlendMode.srcIn)),
            ),
          ],
        ),
        const CommonSizes(height: 2),
        Text('Hi, John! ',
            style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: _purple)),
        const CommonSizes(height: 6),
        Text(
          'Find best course\nfor you',
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: _purple),
        ),
        Text(
          'We have more than 90+ courses',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: _textColor),
        ),
      ],
    );
  }
}
