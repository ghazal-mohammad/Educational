import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/utils/router/router_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  static const Color _bg = Color(0xFFFCF8FF);
  static const Color _purple = Color(0xFF331E53);
  static const Color _border = Color(0xFFB7A4C6);
  static const Color _buttonText = Color(0xFFFCF8FF);

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _getOtp() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter phone')),
      );
      return;
    }

    context.go(RouterPath.submitOtpScreen);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28.h),

                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/login_illustration.png',
                        width: 206.w,
                        height: 206.h,
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome In Educational Portal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: _purple,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      'Phone Number',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: _purple,
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: 52.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.86),
                          border: Border.all(color: _border, width: 2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: _purple,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '09XXXXXXXX',
                            hintStyle: TextStyle(
                              color: _purple.withValues(alpha: 0.70),
                              fontFamily: 'Inter',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    SizedBox(
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
                        onPressed: _getOtp,
                        child: Text(
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

                    SizedBox(height: 40.h),
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