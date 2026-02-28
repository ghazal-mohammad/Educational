// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestAuth _$TestAuthFromJson(Map<String, dynamic> json) {
  return _TestAuth.fromJson(json);
}

/// @nodoc
mixin _$TestAuth {
  @JsonKey(name: 'auth_key')
  String? get authKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'send_in')
  Map<String, String>? get sendIn => throw _privateConstructorUsedError;

  /// Serializes this TestAuth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestAuthCopyWith<TestAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestAuthCopyWith<$Res> {
  factory $TestAuthCopyWith(TestAuth value, $Res Function(TestAuth) then) =
      _$TestAuthCopyWithImpl<$Res, TestAuth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auth_key') String? authKey,
      @JsonKey(name: 'send_in') Map<String, String>? sendIn});
}

/// @nodoc
class _$TestAuthCopyWithImpl<$Res, $Val extends TestAuth>
    implements $TestAuthCopyWith<$Res> {
  _$TestAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authKey = freezed,
    Object? sendIn = freezed,
  }) {
    return _then(_value.copyWith(
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sendIn: freezed == sendIn
          ? _value.sendIn
          : sendIn // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestAuthImplCopyWith<$Res>
    implements $TestAuthCopyWith<$Res> {
  factory _$$TestAuthImplCopyWith(
          _$TestAuthImpl value, $Res Function(_$TestAuthImpl) then) =
      __$$TestAuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auth_key') String? authKey,
      @JsonKey(name: 'send_in') Map<String, String>? sendIn});
}

/// @nodoc
class __$$TestAuthImplCopyWithImpl<$Res>
    extends _$TestAuthCopyWithImpl<$Res, _$TestAuthImpl>
    implements _$$TestAuthImplCopyWith<$Res> {
  __$$TestAuthImplCopyWithImpl(
      _$TestAuthImpl _value, $Res Function(_$TestAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authKey = freezed,
    Object? sendIn = freezed,
  }) {
    return _then(_$TestAuthImpl(
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sendIn: freezed == sendIn
          ? _value._sendIn
          : sendIn // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestAuthImpl with DiagnosticableTreeMixin implements _TestAuth {
  const _$TestAuthImpl(
      {@JsonKey(name: 'auth_key') this.authKey,
      @JsonKey(name: 'send_in') final Map<String, String>? sendIn})
      : _sendIn = sendIn;

  factory _$TestAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestAuthImplFromJson(json);

  @override
  @JsonKey(name: 'auth_key')
  final String? authKey;
  final Map<String, String>? _sendIn;
  @override
  @JsonKey(name: 'send_in')
  Map<String, String>? get sendIn {
    final value = _sendIn;
    if (value == null) return null;
    if (_sendIn is EqualUnmodifiableMapView) return _sendIn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestAuth(authKey: $authKey, sendIn: $sendIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestAuth'))
      ..add(DiagnosticsProperty('authKey', authKey))
      ..add(DiagnosticsProperty('sendIn', sendIn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestAuthImpl &&
            (identical(other.authKey, authKey) || other.authKey == authKey) &&
            const DeepCollectionEquality().equals(other._sendIn, _sendIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, authKey, const DeepCollectionEquality().hash(_sendIn));

  /// Create a copy of TestAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestAuthImplCopyWith<_$TestAuthImpl> get copyWith =>
      __$$TestAuthImplCopyWithImpl<_$TestAuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestAuthImplToJson(
      this,
    );
  }
}

abstract class _TestAuth implements TestAuth {
  const factory _TestAuth(
          {@JsonKey(name: 'auth_key') final String? authKey,
          @JsonKey(name: 'send_in') final Map<String, String>? sendIn}) =
      _$TestAuthImpl;

  factory _TestAuth.fromJson(Map<String, dynamic> json) =
      _$TestAuthImpl.fromJson;

  @override
  @JsonKey(name: 'auth_key')
  String? get authKey;
  @override
  @JsonKey(name: 'send_in')
  Map<String, String>? get sendIn;

  /// Create a copy of TestAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestAuthImplCopyWith<_$TestAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendIn _$SendInFromJson(Map<String, dynamic> json) {
  return _SendIn.fromJson(json);
}

/// @nodoc
mixin _$SendIn {
  String? get header => throw _privateConstructorUsedError;
  @JsonKey(name: 'or_query')
  String? get orQuery => throw _privateConstructorUsedError;
  @JsonKey(name: 'or_bearer_token')
  String? get orBearerToken => throw _privateConstructorUsedError;

  /// Serializes this SendIn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendInCopyWith<SendIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendInCopyWith<$Res> {
  factory $SendInCopyWith(SendIn value, $Res Function(SendIn) then) =
      _$SendInCopyWithImpl<$Res, SendIn>;
  @useResult
  $Res call(
      {String? header,
      @JsonKey(name: 'or_query') String? orQuery,
      @JsonKey(name: 'or_bearer_token') String? orBearerToken});
}

/// @nodoc
class _$SendInCopyWithImpl<$Res, $Val extends SendIn>
    implements $SendInCopyWith<$Res> {
  _$SendInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? orQuery = freezed,
    Object? orBearerToken = freezed,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      orQuery: freezed == orQuery
          ? _value.orQuery
          : orQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      orBearerToken: freezed == orBearerToken
          ? _value.orBearerToken
          : orBearerToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendInImplCopyWith<$Res> implements $SendInCopyWith<$Res> {
  factory _$$SendInImplCopyWith(
          _$SendInImpl value, $Res Function(_$SendInImpl) then) =
      __$$SendInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? header,
      @JsonKey(name: 'or_query') String? orQuery,
      @JsonKey(name: 'or_bearer_token') String? orBearerToken});
}

/// @nodoc
class __$$SendInImplCopyWithImpl<$Res>
    extends _$SendInCopyWithImpl<$Res, _$SendInImpl>
    implements _$$SendInImplCopyWith<$Res> {
  __$$SendInImplCopyWithImpl(
      _$SendInImpl _value, $Res Function(_$SendInImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? orQuery = freezed,
    Object? orBearerToken = freezed,
  }) {
    return _then(_$SendInImpl(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      orQuery: freezed == orQuery
          ? _value.orQuery
          : orQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      orBearerToken: freezed == orBearerToken
          ? _value.orBearerToken
          : orBearerToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendInImpl with DiagnosticableTreeMixin implements _SendIn {
  const _$SendInImpl(
      {this.header,
      @JsonKey(name: 'or_query') this.orQuery,
      @JsonKey(name: 'or_bearer_token') this.orBearerToken});

  factory _$SendInImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendInImplFromJson(json);

  @override
  final String? header;
  @override
  @JsonKey(name: 'or_query')
  final String? orQuery;
  @override
  @JsonKey(name: 'or_bearer_token')
  final String? orBearerToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendIn(header: $header, orQuery: $orQuery, orBearerToken: $orBearerToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendIn'))
      ..add(DiagnosticsProperty('header', header))
      ..add(DiagnosticsProperty('orQuery', orQuery))
      ..add(DiagnosticsProperty('orBearerToken', orBearerToken));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendInImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.orQuery, orQuery) || other.orQuery == orQuery) &&
            (identical(other.orBearerToken, orBearerToken) ||
                other.orBearerToken == orBearerToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, orQuery, orBearerToken);

  /// Create a copy of SendIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendInImplCopyWith<_$SendInImpl> get copyWith =>
      __$$SendInImplCopyWithImpl<_$SendInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendInImplToJson(
      this,
    );
  }
}

abstract class _SendIn implements SendIn {
  const factory _SendIn(
          {final String? header,
          @JsonKey(name: 'or_query') final String? orQuery,
          @JsonKey(name: 'or_bearer_token') final String? orBearerToken}) =
      _$SendInImpl;

  factory _SendIn.fromJson(Map<String, dynamic> json) = _$SendInImpl.fromJson;

  @override
  String? get header;
  @override
  @JsonKey(name: 'or_query')
  String? get orQuery;
  @override
  @JsonKey(name: 'or_bearer_token')
  String? get orBearerToken;

  /// Create a copy of SendIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendInImplCopyWith<_$SendInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
