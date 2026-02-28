// lib/features/auth/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:lms/global/networking/dio_helper.dart';
import 'package:lms/global/networking/failure.dart';
import 'package:lms/global/networking/result_freezed.dart';
import 'package:lms/features/auth/data/model/test_auth.dart';
import 'package:lms/global/utils/consts/urls.dart';
import 'package:path/path.dart'; // استوردي المودل

class AuthRepository {
  final DioHelper dioHelper;

  AuthRepository({required this.dioHelper});

  // 🟢 دالة جلب مفتاح التجربة
  Future<Result<TestAuth>> getTestAuthKey() async {
      print('🌐 Calling API: ${Urls.baseUrl + Urls.test_auth}');
    
    final result = await DioHelper.getModel<TestAuth>(
      Urls.test_auth,
      (json) {
        // 🟢 هنا json هو الـ response كامل (فيه status, message, data)
        print('📦 RAW JSON in getModel: $json');
        return TestAuth.fromJson(json);  // نحول الـ JSON كامل للموديل
      },
    );
    
    // 🟢 نشوف النتيجة
    result.when(
      success: (testAuth) {
       // print('✅ Success: status=${testAuth.status}');
        //print('✅ Message: ${testAuth.message}');
        print('✅ Auth Key: ');
      },
      failure: (error) {
        print('❌ Failure: $error');
      },
    );
    
    return result;
  
}
}
