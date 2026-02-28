import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/di/dependency_injection.dart';
import 'package:lms/global/utils/router/router_path.dart';
import '../../bloc/submit_otp_cubit.dart';
import '../widgets/otp_widgets.dart';

class SubmitOtpScreen extends StatefulWidget {
  final String otpId;
  final String phone;

  const SubmitOtpScreen({super.key, required this.otpId, required this.phone});

  @override
  State<SubmitOtpScreen> createState() => _SubmitOtpScreenState();
}

class _SubmitOtpScreenState extends State<SubmitOtpScreen> {
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
        backgroundColor: const Color(0xFFFCF8FF),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                OtpHeader(phone: widget.phone),

                OtpForm(controller: _cubit.otpController),

                const CommonSizes(height: 25),

                BlocBuilder<SubmitOtpCubit, SubmitOtpState>(
                  builder: (context, state) {
                    return OtpTimerSection(timerText: _cubit.timerText);
                  },
                ),

                const CommonSizes(height: 40),

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
    );
  }
}