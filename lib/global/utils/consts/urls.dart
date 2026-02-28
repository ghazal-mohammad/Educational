class Urls {
  /// Base API URL - تأكد من تحديث هذا مع عنوان الخادم الفعلي
  /// TODO: Replace with your actual API server URL
  /// Example: 'https://api.example.com/api/v1'
  static const String baseUrl = 'https://your-api.com/api';

  /// Auth
  static String loginUrl = '/auth/login';
  static String registerUrl = '/auth/register';
  static String logoutUrl = '/auth/logout';
  static String verifyOtpUrl = '/auth/verify-otp';
  static String getProfile = '/user/profile';
  static String updateProfileUrl = '/user/profile';

  /// Home
  static String homeUrl = '/home';
}
