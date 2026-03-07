import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';

import '../../../../global/utils/router/router_path.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/login_state.dart';
import '../widgets/login_image.dart';
import '../widgets/login_form.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _loginCubit;

  static const Color _bg = Color(0xFFFCF8FF);

  @override
  void initState() {
    super.initState();
    _loginCubit = getIt<LoginCubit>();
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Center(
            child: CommonSizes(
              width: 393.w,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (otpId, phone) {
                          context.pushNamed(
                            RouterPath.submitOtp,
                            extra: {'otpId': otpId, 'phone': phone},
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonSizes(height: 28.h),
                        const LoginImage(),
                        LoginForm(
                          phoneController: _loginCubit.phoneController,
                          formKey: _loginCubit.loginFormKey,
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );
                            return LoginButton(
                              isLoading: isLoading,
                              onPressed: () => _loginCubit.getOtp(),
                            );
                          },
                        ),
                        CommonSizes(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
