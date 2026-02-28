import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lms/global/design/common_sizes.dart';

class OtpHeader extends StatelessWidget {
  final String phone;
  const OtpHeader({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonSizes(height: 12.h),
        Text(
          'Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF331E53),
          ),
        ),
        const CommonSizes(height: 12),
        Text(
          'We sent a code to $phone',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF331E53),
          ),
        ),
        const CommonSizes(height: 8),
      ],
    );
  }
}

class OtpForm extends StatelessWidget {
  final TextEditingController controller;
  const OtpForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class OtpButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  const OtpButton({super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CommonSizes(
      width: double.infinity,
      height: 46.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF331E53),
          disabledBackgroundColor: const Color(0xFF331E53).withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                'SUBMIT',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFCF8FF),
                ),
              ),
      ),
    );
  }
}
