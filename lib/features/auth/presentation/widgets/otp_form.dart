import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lms/global/design/color_app.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';
import '../../bloc/otp/submit_otp_cubit.dart';

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
