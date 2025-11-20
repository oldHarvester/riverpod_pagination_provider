// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_stacktrace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ErrorStackTrace {
  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;

  /// Create a copy of ErrorStackTrace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorStackTraceCopyWith<ErrorStackTrace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorStackTraceCopyWith<$Res> {
  factory $ErrorStackTraceCopyWith(
    ErrorStackTrace value,
    $Res Function(ErrorStackTrace) then,
  ) = _$ErrorStackTraceCopyWithImpl<$Res, ErrorStackTrace>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ErrorStackTraceCopyWithImpl<$Res, $Val extends ErrorStackTrace>
    implements $ErrorStackTraceCopyWith<$Res> {
  _$ErrorStackTraceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorStackTrace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? stackTrace = null}) {
    return _then(
      _value.copyWith(
            error: null == error ? _value.error : error,
            stackTrace:
                null == stackTrace
                    ? _value.stackTrace
                    : stackTrace // ignore: cast_nullable_to_non_nullable
                        as StackTrace,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ErrorStackTraceImplCopyWith<$Res>
    implements $ErrorStackTraceCopyWith<$Res> {
  factory _$$ErrorStackTraceImplCopyWith(
    _$ErrorStackTraceImpl value,
    $Res Function(_$ErrorStackTraceImpl) then,
  ) = __$$ErrorStackTraceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$ErrorStackTraceImplCopyWithImpl<$Res>
    extends _$ErrorStackTraceCopyWithImpl<$Res, _$ErrorStackTraceImpl>
    implements _$$ErrorStackTraceImplCopyWith<$Res> {
  __$$ErrorStackTraceImplCopyWithImpl(
    _$ErrorStackTraceImpl _value,
    $Res Function(_$ErrorStackTraceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ErrorStackTrace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? stackTrace = null}) {
    return _then(
      _$ErrorStackTraceImpl(
        error: null == error ? _value.error : error,
        stackTrace:
            null == stackTrace
                ? _value.stackTrace
                : stackTrace // ignore: cast_nullable_to_non_nullable
                    as StackTrace,
      ),
    );
  }
}

/// @nodoc

class _$ErrorStackTraceImpl implements _ErrorStackTrace {
  const _$ErrorStackTraceImpl({required this.error, required this.stackTrace});

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ErrorStackTrace(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStackTraceImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(error),
    stackTrace,
  );

  /// Create a copy of ErrorStackTrace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStackTraceImplCopyWith<_$ErrorStackTraceImpl> get copyWith =>
      __$$ErrorStackTraceImplCopyWithImpl<_$ErrorStackTraceImpl>(
        this,
        _$identity,
      );
}

abstract class _ErrorStackTrace implements ErrorStackTrace {
  const factory _ErrorStackTrace({
    required final Object error,
    required final StackTrace stackTrace,
  }) = _$ErrorStackTraceImpl;

  @override
  Object get error;
  @override
  StackTrace get stackTrace;

  /// Create a copy of ErrorStackTrace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStackTraceImplCopyWith<_$ErrorStackTraceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
