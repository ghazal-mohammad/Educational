import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lms/global/design/color_app.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';
import '../../bloc/otp/submit_otp_cubit.dart';

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

class OtpForm extends StatelessWidget {
  final TextEditingController controller;
  final String otpId;
  final String phone;

  const OtpForm({
    super.key,
    required this.controller,
    required this.otpId,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: ColorManager.primaryColor,
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: ColorManager.primaryColor,
          fontFamily: 'Ubuntu',
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10.r),
          fieldHeight: 55.h,
          fieldWidth: 55.w,
          activeColor: ColorManager.primaryColor,
          selectedColor: ColorManager.primaryColor,
          inactiveColor: ColorManager.secondaryColor,
          activeFillColor: const Color(0xFFF4EFFF),
          selectedFillColor: const Color(0xFFF4EFFF),
          inactiveFillColor: Colors.white,
        ),
        enableActiveFill: true,
        onCompleted: (v) {
          getIt<SubmitOtpCubit>().verifyOtp(otpId: otpId, phone: phone);
        },
        onChanged: (v) {},
      ),
    );
  }
}

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
