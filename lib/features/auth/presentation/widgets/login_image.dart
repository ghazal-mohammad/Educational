import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/global/utils/consts/assets.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppAssets.loginIllustration,
        width: 206.w,
        height: 206.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
