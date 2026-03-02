import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestKey = _getRequestKey(err.requestOptions);
    final currentRetryCount = _retryCounts[requestKey] ?? 0;

    if (currentRetryCount >= maxRetries) {
      _retryCounts.remove(requestKey);
      handler.next(err);
      return;
    }

    if (_shouldRetry(err)) {
      _retryCounts[requestKey] = currentRetryCount + 1;
      final attempt = _retryCounts[requestKey]!;

      debugPrint('Retrying ${err.requestOptions.path} ($attempt/$maxRetries) بسبب ${err.type}');

      await Future.delayed(retryDelay * attempt);

      try {
        final response = await dio.fetch(err.requestOptions);
        _retryCounts.remove(requestKey);
        handler.resolve(response);
        return;
      } on DioException catch (e) {
        if (attempt >= maxRetries) {
          _retryCounts.remove(requestKey);
          handler.next(e);
          return;
        }
        await onError(e, handler);
        return;
      }
    }

    handler.next(err);
  }

  String _getRequestKey(RequestOptions options) {
    return '${options.method}_${options.baseUrl}${options.path}_${options.data?.hashCode ?? 0}';
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
  }
}