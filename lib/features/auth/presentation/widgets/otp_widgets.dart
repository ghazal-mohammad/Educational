import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// استيرادات الطبقة العالمية للمشروع [1]
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _purpleDark = Color(0xFF331E53);
const Color _purpleLightFill = Color(0xFFF4EFFF);
const Color _purpleBorder = Color(0xFFB7A4C6);
const Color _textMuted = Color(0xFF806D95);

class OtpHeader extends StatelessWidget {
  final String phone;
  const OtpHeader({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CommonSizes(height: 50),
        SvgPicture.asset(AppAssets.otpIllustration, height: 200.h),
        const CommonSizes(height: 30),
        Text(
          'Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: _purpleDark,
          ),
        ),
        const CommonSizes(height: 12),
        Text(
          'We sent a code to $phone',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: _textMuted,
          ),
        ),
        const CommonSizes(height: 30),
      ],
    );
  }
}

class OtpForm extends StatelessWidget {
  final TextEditingController controller;
  const OtpForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: _purpleDark,
        textStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: _purpleDark,
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10.r),
          fieldHeight: 55.h,
          fieldWidth: 55.w,
          activeColor: _purpleDark,
          selectedColor: _purpleDark,
          inactiveColor: _purpleBorder,
          activeFillColor: _purpleLightFill,
          selectedFillColor: _purpleLightFill,
          inactiveFillColor: Colors.white,
          borderWidth: 1,
        ),
        enableActiveFill: true,
        onChanged: (v) {},
      ),
    );
  }
}

class OtpTimerSection extends StatelessWidget {
  final String timerText;
  const OtpTimerSection({super.key, required this.timerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Resend code in ',
          style: TextStyle(color: _textMuted, fontSize: 14.sp),
        ),
        Text(
          timerText,
          style: TextStyle(
            color: _purpleDark,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

class OtpButton extends StatelessWidget {
  final VoidCallback onPressed;
  const OtpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CommonSizes(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _purpleDark,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'SUBMIT',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}