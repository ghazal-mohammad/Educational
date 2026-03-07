import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/design/color_app.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

class OtpTimerSection extends StatelessWidget {
  final String timerText;
  final String phone;

  const OtpTimerSection({
    super.key,
    required this.timerText,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ السطر الأول: النص
        Text(
          'We sent a code to $phone',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.secondaryColor,
          ),
        ),

        const CommonSizes(height: 10),

        // ✅ السطر الثاني: الأيقونة + Resend + الوقت
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.vectorIcon,
              height: 14.h,
              width: 14.w,
            ),
            CommonSizes(width: 6.w),
            Text(
              'Resend',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: ColorManager.primaryColor,
              ),
            ),
            CommonSizes(width: 6.w),
            Text(
              timerText,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: ColorManager.primaryColor,
              ),
            ),
          ],
        ),

        const CommonSizes(height: 25),
      ],
    );
  }
}
