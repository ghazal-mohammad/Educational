import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';
import 'package:lms/global/utils/router/router_path.dart';
import 'package:lms/global/utils/reuses_widgets/messages/snack_bar.dart';
import '../../bloc/otp/submit_otp_cubit.dart';
import '../../bloc/submit_otp_state.dart';
import '../widgets/otp_header.dart';
import '../widgets/otp_form.dart';
import '../widgets/otp_timer_section.dart';
import '../widgets/otp_button.dart';

class SubmitOtpScreen extends StatefulWidget {
  final String otpId;
  final String phone;

  const SubmitOtpScreen({
    super.key,
    required this.otpId,
    required this.phone,
  });

  @override
  State<SubmitOtpScreen> createState() => _SubmitOtpScreenState();
}

class _SubmitOtpScreenState extends State<SubmitOtpScreen> {
  late final SubmitOtpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<SubmitOtpCubit>();
    _cubit.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<SubmitOtpCubit, SubmitOtpState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (token, user, isLoading, secondsLeft, canResend) {
              snackBar(
                context: context,
                title: 'Verified successfully',
                isErrorMessage: false,
              );

              Future.delayed(const Duration(milliseconds: 300), () {
                if (!context.mounted) return;
                context.go(RouterPath.mainLayout);
              });
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFFCF8FF),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const OtpHeader(),
                  const CommonSizes(height: 8),
                  OtpForm(
                    controller: _cubit.otpController,
                    otpId: widget.otpId,
                    phone: widget.phone,
                  ),
                  const CommonSizes(height: 8),
                  BlocBuilder<SubmitOtpCubit, SubmitOtpState>(
                    builder: (context, state) {
                      return OtpTimerSection(
                        timerText: _cubit.timerText,
                        phone: widget.phone,
                      );
                    },
                  ),
                  const CommonSizes(height: 30),
                  OtpButton(
                    onPressed: () {
                      context.go(RouterPath.mainLayout);
                    },
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
