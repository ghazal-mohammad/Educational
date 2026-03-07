import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/design/color_app.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CommonSizes(height: 250),
        SvgPicture.asset(
          AppAssets.otpIllustration,
          height: 200.h,
        ),
        const CommonSizes(height: 10),
        Text(
          'Verification Code',
          style: TextStyle(
            fontFamily: AppAssets.ubuntuFontFamily,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: ColorManager.primaryColor,
          ),
        ),
        const CommonSizes(height: 10),
      ],
    );
  }
}
