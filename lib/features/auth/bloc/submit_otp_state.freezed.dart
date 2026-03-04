// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmitOtpState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  Map<String, dynamic>? get user => throw _privateConstructorUsedError;
  int get secondsLeft => throw _privateConstructorUsedError;
  bool get canResend => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        initial,
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        loading,
    required TResult Function(String token, Map<String, dynamic>? user,
            bool isLoading, int secondsLeft, bool canResend)
        success,
    required TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult? Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult? Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitOtpStateCopyWith<SubmitOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOtpStateCopyWith<$Res> {
  factory $SubmitOtpStateCopyWith(
          SubmitOtpState value, $Res Function(SubmitOtpState) then) =
      _$SubmitOtpStateCopyWithImpl<$Res, SubmitOtpState>;
  @useResult
  $Res call(
      {bool isLoading,
      String token,
      Map<String, dynamic>? user,
      int secondsLeft,
      bool canResend});
}

/// @nodoc
class _$SubmitOtpStateCopyWithImpl<$Res, $Val extends SubmitOtpState>
    implements $SubmitOtpStateCopyWith<$Res> {
  _$SubmitOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? token = null,
    Object? user = freezed,
    Object? secondsLeft = null,
    Object? canResend = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token!
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SubmitOtpStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? errorMessage,
      String? token,
      Map<String, dynamic>? user,
      int secondsLeft,
      bool canResend});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SubmitOtpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? secondsLeft = null,
    Object? canResend = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      this.errorMessage,
      this.token,
      final Map<String, dynamic>? user,
      this.secondsLeft = 54,
      this.canResend = false})
      : _user = user;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String? token;
  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int secondsLeft;
  @override
  @JsonKey()
  final bool canResend;

  @override
  String toString() {
    return 'SubmitOtpState.initial(isLoading: $isLoading, errorMessage: $errorMessage, token: $token, user: $user, secondsLeft: $secondsLeft, canResend: $canResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage, token,
      const DeepCollectionEquality().hash(_user), secondsLeft, canResend);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        initial,
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        loading,
    required TResult Function(String token, Map<String, dynamic>? user,
            bool isLoading, int secondsLeft, bool canResend)
        success,
    required TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)
        error,
  }) {
    return initial(
        isLoading, errorMessage, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult? Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult? Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
  }) {
    return initial?.call(
        isLoading, errorMessage, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isLoading, errorMessage, token, user, secondsLeft, canResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubmitOtpState {
  const factory _Initial(
      {final bool isLoading,
      final String? errorMessage,
      final String? token,
      final Map<String, dynamic>? user,
      final int secondsLeft,
      final bool canResend}) = _$InitialImpl;

  @override
  bool get isLoading;
  String? get errorMessage;
  @override
  String? get token;
  @override
  Map<String, dynamic>? get user;
  @override
  int get secondsLeft;
  @override
  bool get canResend;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $SubmitOtpStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? errorMessage,
      String? token,
      Map<String, dynamic>? user,
      int secondsLeft,
      bool canResend});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SubmitOtpStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? secondsLeft = null,
    Object? canResend = null,
  }) {
    return _then(_$LoadingImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {this.isLoading = true,
      this.errorMessage,
      this.token,
      final Map<String, dynamic>? user,
      this.secondsLeft = 54,
      this.canResend = false})
      : _user = user;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String? token;
  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int secondsLeft;
  @override
  @JsonKey()
  final bool canResend;

  @override
  String toString() {
    return 'SubmitOtpState.loading(isLoading: $isLoading, errorMessage: $errorMessage, token: $token, user: $user, secondsLeft: $secondsLeft, canResend: $canResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage, token,
      const DeepCollectionEquality().hash(_user), secondsLeft, canResend);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        initial,
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        loading,
    required TResult Function(String token, Map<String, dynamic>? user,
            bool isLoading, int secondsLeft, bool canResend)
        success,
    required TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)
        error,
  }) {
    return loading(
        isLoading, errorMessage, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult? Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult? Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
  }) {
    return loading?.call(
        isLoading, errorMessage, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          isLoading, errorMessage, token, user, secondsLeft, canResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubmitOtpState {
  const factory _Loading(
      {final bool isLoading,
      final String? errorMessage,
      final String? token,
      final Map<String, dynamic>? user,
      final int secondsLeft,
      final bool canResend}) = _$LoadingImpl;

  @override
  bool get isLoading;
  String? get errorMessage;
  @override
  String? get token;
  @override
  Map<String, dynamic>? get user;
  @override
  int get secondsLeft;
  @override
  bool get canResend;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $SubmitOtpStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      Map<String, dynamic>? user,
      bool isLoading,
      int secondsLeft,
      bool canResend});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SubmitOtpStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = freezed,
    Object? isLoading = null,
    Object? secondsLeft = null,
    Object? canResend = null,
  }) {
    return _then(_$SuccessImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required this.token,
      final Map<String, dynamic>? user,
      this.isLoading = false,
      this.secondsLeft = 54,
      this.canResend = false})
      : _user = user;

  @override
  final String token;
  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int secondsLeft;
  @override
  @JsonKey()
  final bool canResend;

  @override
  String toString() {
    return 'SubmitOtpState.success(token: $token, user: $user, isLoading: $isLoading, secondsLeft: $secondsLeft, canResend: $canResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      const DeepCollectionEquality().hash(_user),
      isLoading,
      secondsLeft,
      canResend);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        initial,
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        loading,
    required TResult Function(String token, Map<String, dynamic>? user,
            bool isLoading, int secondsLeft, bool canResend)
        success,
    required TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)
        error,
  }) {
    return success(token, user, isLoading, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult? Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult? Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
  }) {
    return success?.call(token, user, isLoading, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(token, user, isLoading, secondsLeft, canResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SubmitOtpState {
  const factory _Success(
      {required final String token,
      final Map<String, dynamic>? user,
      final bool isLoading,
      final int secondsLeft,
      final bool canResend}) = _$SuccessImpl;

  @override
  String get token;
  @override
  Map<String, dynamic>? get user;
  @override
  bool get isLoading;
  @override
  int get secondsLeft;
  @override
  bool get canResend;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $SubmitOtpStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      bool isLoading,
      String? token,
      Map<String, dynamic>? user,
      int secondsLeft,
      bool canResend});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SubmitOtpStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? token = freezed,
    Object? user = freezed,
    Object? secondsLeft = null,
    Object? canResend = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message,
      {this.isLoading = false,
      this.token,
      final Map<String, dynamic>? user,
      this.secondsLeft = 54,
      this.canResend = false})
      : _user = user;

  @override
  final String message;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? token;
  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int secondsLeft;
  @override
  @JsonKey()
  final bool canResend;

  @override
  String toString() {
    return 'SubmitOtpState.error(message: $message, isLoading: $isLoading, token: $token, user: $user, secondsLeft: $secondsLeft, canResend: $canResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading, token,
      const DeepCollectionEquality().hash(_user), secondsLeft, canResend);

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        initial,
    required TResult Function(
            bool isLoading,
            String? errorMessage,
            String? token,
            Map<String, dynamic>? user,
            int secondsLeft,
            bool canResend)
        loading,
    required TResult Function(String token, Map<String, dynamic>? user,
            bool isLoading, int secondsLeft, bool canResend)
        success,
    required TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)
        error,
  }) {
    return error(message, isLoading, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult? Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult? Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult? Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
  }) {
    return error?.call(message, isLoading, token, user, secondsLeft, canResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        initial,
    TResult Function(bool isLoading, String? errorMessage, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        loading,
    TResult Function(String token, Map<String, dynamic>? user, bool isLoading,
            int secondsLeft, bool canResend)?
        success,
    TResult Function(String message, bool isLoading, String? token,
            Map<String, dynamic>? user, int secondsLeft, bool canResend)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isLoading, token, user, secondsLeft, canResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SubmitOtpState {
  const factory _Error(final String message,
      {final bool isLoading,
      final String? token,
      final Map<String, dynamic>? user,
      final int secondsLeft,
      final bool canResend}) = _$ErrorImpl;

  String get message;
  @override
  bool get isLoading;
  @override
  String? get token;
  @override
  Map<String, dynamic>? get user;
  @override
  int get secondsLeft;
  @override
  bool get canResend;

  /// Create a copy of SubmitOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
