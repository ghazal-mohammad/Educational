/// Request model للـ login API
class LoginRequestModel {
  final String phone;

  LoginRequestModel({
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }

  @override
  String toString() => 'LoginRequestModel(phone: $phone)';
}

/// Response model من الـ login API
class LoginResponseModel {
  final bool success;
  final String message;
  final String? token;
  final OtpModel? otp;
  final UserAuthModel? user;

  LoginResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.otp,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String?,
      otp: json['otp'] != null ? OtpModel.fromJson(json['otp'] as Map<String, dynamic>) : null,
      user: json['user'] != null ? UserAuthModel.fromJson(json['user'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'otp': otp?.toJson(),
      'user': user?.toJson(),
    };
  }

  @override
  String toString() => 'LoginResponseModel(success: $success, message: $message)';
}

/// Model للـ OTP
class OtpModel {
  final String otpId;
  final String phone;
  final int expiresIn; // بالثواني
  final DateTime createdAt;

  OtpModel({
    required this.otpId,
    required this.phone,
    required this.expiresIn,
    required this.createdAt,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      otpId: json['otpId'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      expiresIn: json['expiresIn'] as int? ?? 300,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otpId': otpId,
      'phone': phone,
      'expiresIn': expiresIn,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() => 'OtpModel(otpId: $otpId, expiresIn: $expiresIn)';
}

/// User data في الـ response
class UserAuthModel {
  final String id;
  final String phone;
  final String? name;
  final String? email;

  UserAuthModel({
    required this.id,
    required this.phone,
    this.name,
    this.email,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      id: json['id'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      name: json['name'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() => 'UserAuthModel(id: $id, phone: $phone)';
}
