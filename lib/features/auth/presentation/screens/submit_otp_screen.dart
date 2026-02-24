import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../global/utils/router/router_path.dart';

class SubmitOtpScreen extends StatefulWidget {
  const SubmitOtpScreen({super.key});

  @override
  State<SubmitOtpScreen> createState() => _SubmitOtpScreenState();
}

class _SubmitOtpScreenState extends State<SubmitOtpScreen> {
  static const Color _bg = Color(0xFFFCF8FF);
  static const Color _purple = Color(0xFF331E53);
  static const Color _border = Color(0xFFB7A4C6);
  static const Color _muted = Color(0xFF806D95);
  static const Color _buttonText = Color(0xFFFCF8FF);

  String currentText = "";
  bool canResend = false;
  int secondsLeft = 54;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      canResend = false;
      secondsLeft = 54;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (secondsLeft <= 1) {
        t.cancel();
        setState(() {
          secondsLeft = 0;
          canResend = true;
        });
      } else {
        setState(() => secondsLeft--);
      }
    });
  }

  String get _timerText => '00:${secondsLeft.toString().padLeft(2, '0')}';

  void _submit() {
    // حسب طلبك: يروح للهوم مباشرة
    context.go(RouterPath.mainLayout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 393.w,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 28.h),

                    SvgPicture.asset(
                      'assets/images/otp_illustration.svg',
                      width: 193.64.w,
                      height: 206.h,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      'Verification Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: _purple,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'We sent a code to 09XXXXXXXX',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: _purple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          cursorColor: _purple,
                          autoDisposeControllers: false,
                          mainAxisAlignment: MainAxisAlignment.center,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 21.w),
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: _purple,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8.r),
                            fieldHeight: 52.h,
                            fieldWidth: 52.w,
                            activeColor: _border,
                            inactiveColor: _border,
                            selectedColor: _border,
                            borderWidth: 1,
                            activeFillColor:
                                Colors.white.withValues(alpha: 0.86),
                            inactiveFillColor:
                                Colors.white.withValues(alpha: 0.86),
                            selectedFillColor:
                                Colors.white.withValues(alpha: 0.86),
                          ),
                          enableActiveFill: true,
                          onChanged: (value) =>
                              setState(() => currentText = value),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Vector.svg',
                          width: 19.w,
                          height: 16.h,
                          colorFilter: ColorFilter.mode(
                            _muted.withValues(alpha: canResend ? 1.0 : 0.4),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        GestureDetector(
                          onTap: canResend ? _startTimer : null,
                          child: Text(
                            'Resend code',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: _muted.withValues(
                                alpha: canResend ? 1.0 : 0.6,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          _timerText,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: _muted,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // SUBMIT button
                    SizedBox(
                      width: double.infinity,
                      height: 46.h,
                      child: ElevatedButton(
                        onPressed: currentText.length == 4 ? _submit : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _purple,
                          disabledBackgroundColor:
                              _purple.withValues(alpha: 0.40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: _buttonText,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
