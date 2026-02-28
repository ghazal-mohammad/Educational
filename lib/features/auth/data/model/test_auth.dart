import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_auth.freezed.dart';
part 'test_auth.g.dart';

// @freezed
// class TestAuth with _$TestAuth {
//   const factory TestAuth({
//     bool? status,
//     String? message,
//     dynamic? TestAuth,
//     dynamic pagination,
//   }) = _TestAuth;
//   factory TestAuth.fromJson(Map<String, dynamic> json) =>
//       _$TestAuthFromJson(json);
// }

@freezed
class TestAuth with _$TestAuth {
  const factory TestAuth({
    @JsonKey(name: 'auth_key') String? authKey,
    @JsonKey(name: 'send_in') Map<String,String>? sendIn, // هنا SendIn (كلاس ثالث)
  }) = _TestAuth;

  factory TestAuth.fromJson(Map<String, dynamic> json) => _$TestAuthFromJson(json);
}

// 🟢 كلاس SendIn (الموجود جوا test_auth.dart)
@freezed
class SendIn with _$SendIn {
  const factory SendIn({
    String? header,
    @JsonKey(name: 'or_query') String? orQuery,
    @JsonKey(name: 'or_bearer_token') String? orBearerToken,
  }) = _SendIn;

  factory SendIn.fromJson(Map<String, dynamic> json) => _$SendInFromJson(json);
}

class AuthRepository {
  late final Dio dio;

  Future<TestAuth> getAuthKey() async {
    // Dio: يجيب البيانات
    final response = await dio.get('/test-records');

    // Freezed: ينظم البيانات
    return TestAuth.fromJson(response.data); // ✅ أحلى تعاون!
  }
}
