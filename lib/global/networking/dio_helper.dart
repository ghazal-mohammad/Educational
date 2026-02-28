import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lms/global/networking/request_headers_interceptors.dart';
import 'package:lms/global/networking/result_freezed.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/consts/urls.dart';
import '../utils/helper/console_logger.dart';
import 'failure.dart';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';

typedef JsonDecoder<T> = T Function(Map<String, dynamic> json);

class DioHelper {
  static late Dio dio;
  static PrettyDioLogger prettyInterceptors = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    request: true,
    error: true,
    compact: false,
    maxWidth: 90,
  );

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        validateStatus: (x) {
          if (x == 403) return true;
          return x! <= 205;
        },
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );

    // Only apply bad certificate bypass on native platforms (not Web)
    if (!kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          io.HttpClient()..badCertificateCallback = (cert, host, port) => true;
    }

    dio.interceptors.addAll([
      prettyInterceptors,
      RequestHeadersInterceptors(),
      RetryInterceptor(dio: dio),
    ]);

    initHeaders();
  }

  static void initHeaders() {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<Result<List<Model>>> getAllModel<Model>({
    required String url,
    JsonDecoder<Model>? fromJson,
    Map<String, dynamic>? body,
    String? method = 'GET',
    Map<String, dynamic>? query,
    String? token,
    int retryCount = 1,
    bool newUrl = false,
  }) async {
    int attempt = 1;
    while (attempt <= retryCount) {
      try {
        Response<dynamic> response;
        List<Model> objects = [];

        if (method == "GET") {
          if (newUrl) {
            response = await Dio().get(url, data: body, queryParameters: query);
          } else {
            response = await dio.get(url, data: body, queryParameters: query);
          }
        } else {
          response = await dio.post(url, data: body, queryParameters: query);
        }

        for (dynamic d in response.data['data']) {
          var r = fromJson!(d);
          objects.add(r);
        }

        return Result.success(objects);
      } on DioException catch (e) {
        attempt++;
        return Result.failure(getDioError(e));
      } catch (e, s) {
        printError("Flutter error");
        printError(s.toString());
        printError(e.toString());
        return Result.failure(UnKnownFailure());
      }
    }

    return Result.failure(UnKnownFailure());
  }

  static Future<Result<T>> getModel<T>(
    String url,
    JsonDecoder<T>? fromJson, {
    String? token,
    Object? data,
    Map<String, dynamic>? qurey,
  }) async {
    return errorHandling(
      () async {
        return await dio.get(url, data: data, queryParameters: qurey);
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<T>> postModel<T>(
    String url,
    dynamic obj, {
    JsonDecoder<T>? fromJson,
    String? token,
    Map<String, dynamic>? customHeaders,
    Options? options,
  }) async {
    return errorHandling(
      () async {
        final headers = <String, dynamic>{};

        if (token != null) {
          headers['Authorization'] = 'Bearer $token';
        }

        if (customHeaders != null) {
          headers.addAll(customHeaders);
        }

        if (options?.headers != null) {
          headers.addAll(options!.headers!);
        }

        final mergedOptions = (options ?? Options()).copyWith(
          headers: headers,
        );

        return await dio.post(
          url,
          data: obj,
          options: mergedOptions,
        );
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<T>> patchModel<T>(
    String url,
    dynamic body, {
    JsonDecoder<T>? fromJson,
    String? token,
    Map<String, dynamic>? customHeaders,
    Options? options,
  }) async {
    return errorHandling(
      () async {
        final headers = <String, dynamic>{};

        if (customHeaders != null) {
          headers.addAll(customHeaders);
        }

        if (options?.headers != null) {
          headers.addAll(options!.headers!);
        }

        final mergedOptions = (options ?? Options()).copyWith(
          headers: headers,
        );

        return await dio.patch(
          url,
          data: body,
          options: mergedOptions,
        );
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<T>> putModel<T>(
    String url,
    dynamic body, {
    JsonDecoder<T>? fromJson,
  }) async {
    return errorHandling(() async => await dio.put(url, data: body),
        fromJson: fromJson);
  }

  static Future<Result<bool>> deleteModel(
      {required String url, required dynamic body}) async {
    return errorHandling(
      () async => await dio.delete(url, data: body),
    );
  }

  static Future<Result<T>> errorHandling<T>(
    Future<Response<dynamic>> Function() request, {
    JsonDecoder<T>? fromJson,
    bool? postData,
    int retryCount = 1,
  }) async {
    int attempt = 1;
    while (attempt <= retryCount) {
      try {
        final response = await request();

        if (postData == true) {
          return Result.success(response.data['data']);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (fromJson != null && response.data is Map<String, dynamic>) {
            if (response.data.containsKey("data")) {
              final dataField = response.data["data"];

              if (dataField is Map<String, dynamic>) {
                return Result.success(fromJson(dataField));
              }

              if (dataField is List && dataField.isEmpty) {
                return Result.success(fromJson({}));
              }

              return Result.failure(ServerError(
                  "Unexpected format for 'data' field in response"));
            } else {
              return Result.success(fromJson(response.data));
            }
          }

          if (T == bool) {
            return Result.success(true as T);
          }
          return Result.success(
              response.data["message"] ?? "operation_successful".tr());
        }

        if (response.data != null) {
          if (response.data["code"] == 403) {
            return Result.failure(SessionExpired());
          }
          if (response.data['code'] == 700) {
            return Result.failure(UnActiveAccount());
          }
          if (response.statusCode == 401) {
            return Result.failure(Unauthorized());
          }
          printError(response.statusCode.toString());
          return Result.failure(ServerError(
              response.data["message"] ?? "unknown_server_error".tr()));
        }

        printError("unexpected_server_response");
        return Result.failure(ServerError("unexpected_server_response".tr()));
      } on DioException catch (e) {
        printError("Catch DioException");
        attempt++;
        if (attempt > retryCount) {
          return Result.failure(getDioError(e));
        }
        await Future.delayed(const Duration(seconds: 2));
      } catch (e, s) {
        printError("Flutter error");
        printError(s.toString());
        printError(e.toString());
        return Result.failure(UnKnownFailure());
      }
    }

    return Result.failure(UnKnownFailure());
  }

  // Dio Exception Handler
  static Failure getDioError(DioException e) {
    debugPrint("Dio error type: ${e.type}");
    debugPrint("Dio error message: ${e.message}");
    debugPrint("Dio error response: ${e.response?.data}");

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerError("connection_timeout".tr());

      case DioExceptionType.sendTimeout:
        return ServerError("send_timeout".tr());

      case DioExceptionType.badResponse:
        return handleHttpResponseError(
            e.response?.statusCode ?? 500, e.response?.data);

      case DioExceptionType.cancel:
        return ServerError("request_cancelled".tr());

      case DioExceptionType.connectionError:
        return NetworkFailure();

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return NetworkFailure();
        }
        return ServerError(e.message ?? "unexpected_network_error".tr());

      default:
        return ServerError("something_went_wrong".tr());
    }
  }

  // Handle HTTP Response Errors
  static Failure handleHttpResponseError(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return BadRequest(
            errors: _extractValidationErrors(data), message: data['message']);
      case 401:
        return Unauthorized();
      case 422:
        return ValidationInputError(
            errors: _extractValidationErrors(data), message: data['message']);
      case 403:
        return Forbidden(message: data['message']);
      case 404:
        return NotFound();
      case 409:
        return Conflict(message: data?['message']);
      case 429:
        return TooManyRequests();
      case 500:
        return InternalServerError();
      case 502:
        return BadGateway();
      case 503:
        return ServiceUnavailable();
      case 504:
        return GatewayTimeout();
      default:
        final message = data?['message'] ?? "something_went_wrong".tr();
        return ServerError(message);
    }
  }

  static Map<String, dynamic>? _extractValidationErrors(dynamic data) {
    try {
      if (data is Map<String, dynamic> && data.containsKey('errors')) {
        return data['errors'] as Map<String, dynamic>;
      }
    } catch (e) {
      printError("Error extracting validation errors: ${e.toString()}");
    }
    return null;
  }
}
