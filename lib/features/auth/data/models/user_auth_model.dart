import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_model.freezed.dart';
part 'user_auth_model.g.dart';

@freezed
class UserAuthModel with _$UserAuthModel {
  const factory UserAuthModel({
    @Default('') String id,
    @Default('') String phone,
    String? name,
    String? email,
  }) = _UserAuthModel;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthModelFromJson(json);
}
