import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/main/presentation/screens/main_layout.dart' show MainLayout;
import 'router_path.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/submit_otp_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouterPath.loginScreen,
  routes: [
    GoRoute(
      name: RouterPath.login,
      path: RouterPath.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RouterPath.submitOtp,
      path: RouterPath.submitOtpScreen,
      // pass otpId/phone as extras when navigating from login
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>?;
        final otpId = extras?['otpId'] as String?;
        final phone = extras?['phone'] as String?;
        return SubmitOtpScreen(
          otpId: otpId ?? '',
          phone: phone ?? '',
        );
      },
    ),
    GoRoute(
      name: RouterPath.main,
      path: RouterPath.mainLayout,
      builder: (context, state) => const MainLayout(),
    ),
  ],
);