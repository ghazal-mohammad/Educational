import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/common_sizes.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  static const Color _purple = Color(0xFF331E53);
  static const Color _buttonText = Color(0xFFFCF8FF);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonSizes(height: 30.h),
        CommonSizes(
          width: double.infinity,
          height: 46.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.r),
              ),
              elevation: 0,
            ),
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(_buttonText),
                    ),
                  )
                : Text(
                    'GET OTP',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: _buttonText,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
