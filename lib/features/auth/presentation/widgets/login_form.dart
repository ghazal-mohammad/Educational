import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/common_sizes.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/login_state.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.formKey,
  });

  static const Color _purple = Color(0xFF331E53);
  static const Color _border = Color(0xFFB7A4C6);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonSizes(height: 24.h),
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
        const CommonSizes(height: 12),
        Text(
          'Phone Number',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: _purple,
          ),
        ),
        const CommonSizes(height: 8),
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
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      '+963',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: _purple,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: _purple, size: 20.sp),
                    const CommonSizes(width: 8),
                    Container(
                      width: 1,
                      height: 22.h,
                      color: _border.withValues(alpha: 0.5),
                    ),
                    const CommonSizes(width: 12),
                  ],
                ),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      context.read<LoginCubit>().getOtp();
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: _purple,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'XXXXXXXX',
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
              ],
            ),
          ),
        ),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final errorMessage = state.maybeWhen(
              error: (message) => message,
              orElse: () => null,
            );

            if (errorMessage != null) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h, left: 4.w),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFB7A4C6),
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              );
            }

            return const CommonSizes(height: 24);
          },
        ),
      ]
    );
  }
}