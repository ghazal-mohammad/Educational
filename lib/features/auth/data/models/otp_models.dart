import 'package:equatable/equatable.dart';

class OtpResponseModel extends Equatable {
  final bool success;
  final String message;
  final String? token;
  final Map<String, dynamic>? user;

  const OtpResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String?,
      user: json['user'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        if (token != null) 'token': token,
        if (user != null) 'user': user,
      };

  @override
  List<Object?> get props => [success, message, token, user];
}
