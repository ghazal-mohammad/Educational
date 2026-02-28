import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';
import 'package:lms/global/utils/router/router_path.dart';
import 'package:lms/global/utils/consts/assets.dart';
import '../../bloc/submit_otp_cubit.dart';

class SubmitOtpScreen extends StatefulWidget {
  final String otpId;
  final String phone;

  const SubmitOtpScreen({super.key, required this.otpId, required this.phone});

  @override
  State<SubmitOtpScreen> createState() => _SubmitOtpScreenState();
}

class _SubmitOtpScreenState extends State<SubmitOtpScreen> {
  static const Color _purpleDark = Color(0xFF331E53);
  static const Color _purpleLightFill = Color(0xFFF4EFFF);
  static const Color _purpleBorder = Color(0xFFB7A4C6);
  static const Color _figmaBg = Color(0xFFFCF8FF);

  late final SubmitOtpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<SubmitOtpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: _figmaBg,
        body: SafeArea(
          child: BlocListener<SubmitOtpCubit, SubmitOtpState>(
            listener: (context, state) {
              if (state.token != null && state.token!.isNotEmpty) {
                context.go(RouterPath.mainLayout);
              }
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  CommonSizes(height: 50.h),
                  SvgPicture.asset(AppAssets.otpIllustration, height: 200.h),
                  CommonSizes(height: 30.h),
                  Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: _purpleDark,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  CommonSizes(height: 12.h),
                  Text(
                    'We sent a code to ${widget.phone}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp, color: const Color(0xFF806D95)),
                  ),
                  CommonSizes(height: 30.h),

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: _cubit.otpController,
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
                      onChanged: (v) => setState(() {}),
                    ),
                  ),

                  CommonSizes(height: 25.h),

                  BlocBuilder<SubmitOtpCubit, SubmitOtpState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Resend code in ', style: TextStyle(color: const Color(0xFF806D95))),
                          Text(
                            _cubit.timerText,
                            style: TextStyle(color: _purpleDark, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),

                  CommonSizes(height: 40.h),

              CommonSizes(
                width: double.infinity,
                child: ElevatedButton(
                  // ✅ انتقال فوري للناف بار كما طلبتِ
                  onPressed: () => context.go(RouterPath.mainLayout),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _purpleDark,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                  ),
                  child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                ),
              ),

              const CommonSizes(height: 30),
                ],
              ),
            ),
          ),

        ),
      ),
      );
    }
}