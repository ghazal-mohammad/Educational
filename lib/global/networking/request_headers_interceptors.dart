import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core/app_state.dart';
import '../utils/di/dependency_injection.dart';

class RequestHeadersInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      if (getIt.isReady<AppStateModel>() == false) {
        debugPrint('AppStateModel not ready, skipping headers');
        return handler.next(options);
      }

      final appState = getIt<AppStateModel>();

      // Add Authorization header if available
      if (appState.userToken != null && appState.userToken!.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer ${appState.userToken}';
        debugPrint('Added Authorization header');
      }

      // Add language header
      if (appState.locale.languageCode.isNotEmpty) {
        options.headers['lang'] = appState.locale.languageCode;
        debugPrint('Added languageCode: ${appState.locale.languageCode}');
      }
    } catch (e) {
      debugPrint('Error in RequestHeadersInterceptors: $e');
    }

    return handler.next(options);
  }
}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;
  final Map<String, int> _retryCounts = {};

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestKey = _getRequestKey(err.requestOptions);

    final currentRetryCount = _retryCounts[requestKey] ?? 0;

    if (currentRetryCount >= maxRetries) {
      debugPrint('Max retries reached for request: $requestKey');
      _retryCounts.remove(requestKey);
      return handler.next(err);
    }

    if (_shouldRetry(err)) {
      _retryCounts[requestKey] = currentRetryCount + 1;
      final newRetryCount = _retryCounts[requestKey]!;

      debugPrint(
          'Retrying request due to: ${err.type} (attempt $newRetryCount/$maxRetries)');

      try {
        await Future.delayed(retryDelay * newRetryCount);

        final cleanDio = Dio(BaseOptions(
          baseUrl: err.requestOptions.baseUrl,
          connectTimeout: err.requestOptions.connectTimeout,
          receiveTimeout: err.requestOptions.receiveTimeout,
          headers: err.requestOptions.headers,
        ));

        final response = await cleanDio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        debugPrint('Retry successful on attempt $newRetryCount');
        _retryCounts.remove(requestKey);
        return handler.resolve(response);
      } on DioException catch (e) {
        debugPrint('Retry attempt $newRetryCount failed: ${e.type}');
        if (newRetryCount >= maxRetries) {
          debugPrint('Max retries reached, giving up');
          _retryCounts.remove(requestKey);
          return handler.next(e);
        }
        return onError(e, handler);
      }
    }

    return handler.next(err);
  }

  String _getRequestKey(RequestOptions options) {
    return '${options.method}_${options.path}_${options.data?.hashCode ?? 0}';
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
  }
}

