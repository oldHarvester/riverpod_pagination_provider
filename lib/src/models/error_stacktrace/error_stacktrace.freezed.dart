// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_stacktrace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ErrorStackTrace {

 Object get error; StackTrace get stackTrace;
/// Create a copy of ErrorStackTrace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStackTraceCopyWith<ErrorStackTrace> get copyWith => _$ErrorStackTraceCopyWithImpl<ErrorStackTrace>(this as ErrorStackTrace, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorStackTrace&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ErrorStackTrace(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ErrorStackTraceCopyWith<$Res>  {
  factory $ErrorStackTraceCopyWith(ErrorStackTrace value, $Res Function(ErrorStackTrace) _then) = _$ErrorStackTraceCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace stackTrace
});




}
/// @nodoc
class _$ErrorStackTraceCopyWithImpl<$Res>
    implements $ErrorStackTraceCopyWith<$Res> {
  _$ErrorStackTraceCopyWithImpl(this._self, this._then);

  final ErrorStackTrace _self;
  final $Res Function(ErrorStackTrace) _then;

/// Create a copy of ErrorStackTrace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error ,stackTrace: null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorStackTrace].
extension ErrorStackTracePatterns on ErrorStackTrace {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorStackTrace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorStackTrace() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorStackTrace value)  $default,){
final _that = this;
switch (_that) {
case _ErrorStackTrace():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorStackTrace value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorStackTrace() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Object error,  StackTrace stackTrace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorStackTrace() when $default != null:
return $default(_that.error,_that.stackTrace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Object error,  StackTrace stackTrace)  $default,) {final _that = this;
switch (_that) {
case _ErrorStackTrace():
return $default(_that.error,_that.stackTrace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Object error,  StackTrace stackTrace)?  $default,) {final _that = this;
switch (_that) {
case _ErrorStackTrace() when $default != null:
return $default(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class _ErrorStackTrace implements ErrorStackTrace {
  const _ErrorStackTrace({required this.error, required this.stackTrace});
  

@override final  Object error;
@override final  StackTrace stackTrace;

/// Create a copy of ErrorStackTrace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStackTraceCopyWith<_ErrorStackTrace> get copyWith => __$ErrorStackTraceCopyWithImpl<_ErrorStackTrace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorStackTrace&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ErrorStackTrace(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class _$ErrorStackTraceCopyWith<$Res> implements $ErrorStackTraceCopyWith<$Res> {
  factory _$ErrorStackTraceCopyWith(_ErrorStackTrace value, $Res Function(_ErrorStackTrace) _then) = __$ErrorStackTraceCopyWithImpl;
@override @useResult
$Res call({
 Object error, StackTrace stackTrace
});




}
/// @nodoc
class __$ErrorStackTraceCopyWithImpl<$Res>
    implements _$ErrorStackTraceCopyWith<$Res> {
  __$ErrorStackTraceCopyWithImpl(this._self, this._then);

  final _ErrorStackTrace _self;
  final $Res Function(_ErrorStackTrace) _then;

/// Create a copy of ErrorStackTrace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(_ErrorStackTrace(
error: null == error ? _self.error : error ,stackTrace: null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
