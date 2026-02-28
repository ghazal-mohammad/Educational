import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lms/global/design/common_sizes.dart';
import '../../../../global/utils/consts/assets.dart';
import '../../bloc/submit_otp_cubit.dart';

const Color _purpleDark = Color(0xFF331E53);
const Color _purpleLightFill = Color(0xFFF4EFFF);
const Color _purpleBorder = Color(0xFFB7A4C6);

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
            color: _purpleDark,
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

  const OtpForm({super.key, required this.controller, required this.otpId, required this.phone});

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
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: _purpleDark,
          fontFamily: 'Ubuntu',
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
        ),
        enableActiveFill: true,
        onCompleted: (v) {
          context.read<SubmitOtpCubit>().verifyOtp(otpId: otpId, phone: phone);
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
            color: const Color(0xFFB7A4C6),
          ),
        ),

        const CommonSizes(height: 10),

        // ✅ السطر الثاني: الأيقونة + Resend + الوقت
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SvgPicture.asset(
              AppAssets.vectorIcon, // أيقونة الإعادة
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
                color: _purpleDark,
              ),
            ),

            CommonSizes(width: 6.w),

            Text(
              timerText,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: _purpleDark,
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
  const OtpButton({super.key, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CommonSizes(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _purpleDark,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.r)),
        ),
        child: isLoading
            ? CommonSizes(height:2.h,
            width: 20.w,
            child: const CircularProgressIndicator(
                color: Colors.white, strokeWidth: 2))
            : const Text(
            'SUBMIT', style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );

  }
}
