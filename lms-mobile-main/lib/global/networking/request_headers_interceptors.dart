import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../core/app_state.dart';
import '../utils/di/dependency_injection.dart';

class RequestHeadersInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    try {
      // 1) إذا مو مسجل أصلاً، لا تكمل
      if (!getIt.isRegistered<AppStateModel>()) {
        debugPrint('AppStateModel not registered, skipping headers');
        handler.next(options);
        return;
      }

      // 2) استنى لحد ما يصير جاهز (isReady بيرجع Future<void>)
      await getIt.isReady<AppStateModel>();

      final appState = getIt<AppStateModel>();

      // Authorization
      final token = appState.userToken;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      // Language
      final lang = appState.locale.languageCode;
      if (lang.isNotEmpty) {
        options.headers['lang'] = lang;
      }
    } catch (e) {
      debugPrint('Error in RequestHeadersInterceptors: $e');
    }

    handler.next(options);
  }
}