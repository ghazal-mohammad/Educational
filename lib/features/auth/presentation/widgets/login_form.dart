import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/color_app.dart';
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
              color: ColorManager.primaryColor,
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
            color: ColorManager.primaryColor,
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
              border: Border.all(color: ColorManager.secondaryColor, width: 2),
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
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down,
                        color: ColorManager.primaryColor, size: 20.sp),
                    const CommonSizes(width: 8),
                    Container(
                      width: 1,
                      height: 22.h,
                      color: ColorManager.secondaryColor.withValues(alpha: 0.5),
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
                      // Trigger getOtp through the form if needed
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'XXXXXXXX',
                      hintStyle: TextStyle(
                        color:
                            ColorManager.primaryColor.withValues(alpha: 0.70),
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
                    color: ColorManager.secondaryColor,
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
      ],
    );
  }
}
