import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router_path.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/submit_otp_screen.dart';
import '../../../features/main/presentation/screens/main_layout.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouterPath.loginScreen,
  routes: [
    GoRoute(
      path: RouterPath.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterPath.submitOtpScreen,
      builder: (context, state) => const SubmitOtpScreen(),
    ),
    GoRoute(
      path: RouterPath.mainLayout,
      builder: (context, state) => const MainLayout(),
    ),
  ],
);