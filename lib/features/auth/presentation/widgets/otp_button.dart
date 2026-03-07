import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/color_app.dart';
import 'package:lms/global/design/common_sizes.dart';

class OtpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const OtpButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonSizes(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
        ),
        child: isLoading
            ? CommonSizes(
                height: 2.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'SUBMIT',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
      ),
    );
  }
}
