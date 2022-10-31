// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unathorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unathorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unathorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiExceptionConnectivity value) connectivity,
    required TResult Function(ApiExceptionUnauthorized value) unathorized,
    required TResult Function(_ApiExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_ApiExceptionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiExceptionConnectivity value)? connectivity,
    TResult? Function(ApiExceptionUnauthorized value)? unathorized,
    TResult? Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(_ApiExceptionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiExceptionConnectivity value)? connectivity,
    TResult Function(ApiExceptionUnauthorized value)? unathorized,
    TResult Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_ApiExceptionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res, ApiException>;
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ApiExceptionConnectivityCopyWith<$Res> {
  factory _$$ApiExceptionConnectivityCopyWith(_$ApiExceptionConnectivity value,
          $Res Function(_$ApiExceptionConnectivity) then) =
      __$$ApiExceptionConnectivityCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ApiExceptionConnectivityCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ApiExceptionConnectivity>
    implements _$$ApiExceptionConnectivityCopyWith<$Res> {
  __$$ApiExceptionConnectivityCopyWithImpl(_$ApiExceptionConnectivity _value,
      $Res Function(_$ApiExceptionConnectivity) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ApiExceptionConnectivity implements ApiExceptionConnectivity {
  const _$ApiExceptionConnectivity();

  @override
  String toString() {
    return 'ApiException.connectivity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiExceptionConnectivity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unathorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return connectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unathorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return connectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unathorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiExceptionConnectivity value) connectivity,
    required TResult Function(ApiExceptionUnauthorized value) unathorized,
    required TResult Function(_ApiExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_ApiExceptionError value) error,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiExceptionConnectivity value)? connectivity,
    TResult? Function(ApiExceptionUnauthorized value)? unathorized,
    TResult? Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(_ApiExceptionError value)? error,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiExceptionConnectivity value)? connectivity,
    TResult Function(ApiExceptionUnauthorized value)? unathorized,
    TResult Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_ApiExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class ApiExceptionConnectivity implements ApiException {
  const factory ApiExceptionConnectivity() = _$ApiExceptionConnectivity;
}

/// @nodoc
abstract class _$$ApiExceptionUnauthorizedCopyWith<$Res> {
  factory _$$ApiExceptionUnauthorizedCopyWith(_$ApiExceptionUnauthorized value,
          $Res Function(_$ApiExceptionUnauthorized) then) =
      __$$ApiExceptionUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ApiExceptionUnauthorizedCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ApiExceptionUnauthorized>
    implements _$$ApiExceptionUnauthorizedCopyWith<$Res> {
  __$$ApiExceptionUnauthorizedCopyWithImpl(_$ApiExceptionUnauthorized _value,
      $Res Function(_$ApiExceptionUnauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ApiExceptionUnauthorized implements ApiExceptionUnauthorized {
  const _$ApiExceptionUnauthorized();

  @override
  String toString() {
    return 'ApiException.unathorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiExceptionUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unathorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return unathorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unathorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return unathorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unathorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (unathorized != null) {
      return unathorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiExceptionConnectivity value) connectivity,
    required TResult Function(ApiExceptionUnauthorized value) unathorized,
    required TResult Function(_ApiExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_ApiExceptionError value) error,
  }) {
    return unathorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiExceptionConnectivity value)? connectivity,
    TResult? Function(ApiExceptionUnauthorized value)? unathorized,
    TResult? Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(_ApiExceptionError value)? error,
  }) {
    return unathorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiExceptionConnectivity value)? connectivity,
    TResult Function(ApiExceptionUnauthorized value)? unathorized,
    TResult Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_ApiExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (unathorized != null) {
      return unathorized(this);
    }
    return orElse();
  }
}

abstract class ApiExceptionUnauthorized implements ApiException {
  const factory ApiExceptionUnauthorized() = _$ApiExceptionUnauthorized;
}

/// @nodoc
abstract class _$$_ApiExceptionErrorMessageCopyWith<$Res> {
  factory _$$_ApiExceptionErrorMessageCopyWith(
          _$_ApiExceptionErrorMessage value,
          $Res Function(_$_ApiExceptionErrorMessage) then) =
      __$$_ApiExceptionErrorMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ApiExceptionErrorMessageCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_ApiExceptionErrorMessage>
    implements _$$_ApiExceptionErrorMessageCopyWith<$Res> {
  __$$_ApiExceptionErrorMessageCopyWithImpl(_$_ApiExceptionErrorMessage _value,
      $Res Function(_$_ApiExceptionErrorMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ApiExceptionErrorMessage(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ApiExceptionErrorMessage implements _ApiExceptionErrorMessage {
  const _$_ApiExceptionErrorMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ApiException.errorWithMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiExceptionErrorMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiExceptionErrorMessageCopyWith<_$_ApiExceptionErrorMessage>
      get copyWith => __$$_ApiExceptionErrorMessageCopyWithImpl<
          _$_ApiExceptionErrorMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unathorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return errorWithMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unathorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return errorWithMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unathorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiExceptionConnectivity value) connectivity,
    required TResult Function(ApiExceptionUnauthorized value) unathorized,
    required TResult Function(_ApiExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_ApiExceptionError value) error,
  }) {
    return errorWithMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiExceptionConnectivity value)? connectivity,
    TResult? Function(ApiExceptionUnauthorized value)? unathorized,
    TResult? Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(_ApiExceptionError value)? error,
  }) {
    return errorWithMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiExceptionConnectivity value)? connectivity,
    TResult Function(ApiExceptionUnauthorized value)? unathorized,
    TResult Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_ApiExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(this);
    }
    return orElse();
  }
}

abstract class _ApiExceptionErrorMessage implements ApiException {
  const factory _ApiExceptionErrorMessage(final String message) =
      _$_ApiExceptionErrorMessage;

  String get message;
  @JsonKey(ignore: true)
  _$$_ApiExceptionErrorMessageCopyWith<_$_ApiExceptionErrorMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ApiExceptionErrorCopyWith<$Res> {
  factory _$$_ApiExceptionErrorCopyWith(_$_ApiExceptionError value,
          $Res Function(_$_ApiExceptionError) then) =
      __$$_ApiExceptionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ApiExceptionErrorCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_ApiExceptionError>
    implements _$$_ApiExceptionErrorCopyWith<$Res> {
  __$$_ApiExceptionErrorCopyWithImpl(
      _$_ApiExceptionError _value, $Res Function(_$_ApiExceptionError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ApiExceptionError implements _ApiExceptionError {
  const _$_ApiExceptionError();

  @override
  String toString() {
    return 'ApiException.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ApiExceptionError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unathorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unathorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unathorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiExceptionConnectivity value) connectivity,
    required TResult Function(ApiExceptionUnauthorized value) unathorized,
    required TResult Function(_ApiExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_ApiExceptionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiExceptionConnectivity value)? connectivity,
    TResult? Function(ApiExceptionUnauthorized value)? unathorized,
    TResult? Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(_ApiExceptionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiExceptionConnectivity value)? connectivity,
    TResult Function(ApiExceptionUnauthorized value)? unathorized,
    TResult Function(_ApiExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_ApiExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ApiExceptionError implements ApiException {
  const factory _ApiExceptionError() = _$_ApiExceptionError;
}
