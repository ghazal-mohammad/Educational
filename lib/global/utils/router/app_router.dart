import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/global/utils/router/router_path.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouterPath.loginScreen,
  routes: [
  //  GoRoute(
    //   path: RouterPath.loginScreen,
     //name: 'loginScreen',
      // builder: (context, state) => const LoginScreen(),
     //),
    // TODO: Add more routes as needed
  ],
);
