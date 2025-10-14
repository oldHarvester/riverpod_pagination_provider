// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedListResponse<T> {

 List<T> get results; int get totalCount;
/// Create a copy of PaginatedListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedListResponseCopyWith<T, PaginatedListResponse<T>> get copyWith => _$PaginatedListResponseCopyWithImpl<T, PaginatedListResponse<T>>(this as PaginatedListResponse<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedListResponse<T>&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),totalCount);

@override
String toString() {
  return 'PaginatedListResponse<$T>(results: $results, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $PaginatedListResponseCopyWith<T,$Res>  {
  factory $PaginatedListResponseCopyWith(PaginatedListResponse<T> value, $Res Function(PaginatedListResponse<T>) _then) = _$PaginatedListResponseCopyWithImpl;
@useResult
$Res call({
 List<T> results, int totalCount
});




}
/// @nodoc
class _$PaginatedListResponseCopyWithImpl<T,$Res>
    implements $PaginatedListResponseCopyWith<T, $Res> {
  _$PaginatedListResponseCopyWithImpl(this._self, this._then);

  final PaginatedListResponse<T> _self;
  final $Res Function(PaginatedListResponse<T>) _then;

/// Create a copy of PaginatedListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedListResponse].
extension PaginatedListResponsePatterns<T> on PaginatedListResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedListResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedListResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedListResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> results,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedListResponse() when $default != null:
return $default(_that.results,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> results,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _PaginatedListResponse():
return $default(_that.results,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> results,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedListResponse() when $default != null:
return $default(_that.results,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedListResponse<T> extends PaginatedListResponse<T> {
  const _PaginatedListResponse({required final  List<T> results, required this.totalCount}): _results = results,super._();
  

 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  int totalCount;

/// Create a copy of PaginatedListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedListResponseCopyWith<T, _PaginatedListResponse<T>> get copyWith => __$PaginatedListResponseCopyWithImpl<T, _PaginatedListResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedListResponse<T>&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),totalCount);

@override
String toString() {
  return 'PaginatedListResponse<$T>(results: $results, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$PaginatedListResponseCopyWith<T,$Res> implements $PaginatedListResponseCopyWith<T, $Res> {
  factory _$PaginatedListResponseCopyWith(_PaginatedListResponse<T> value, $Res Function(_PaginatedListResponse<T>) _then) = __$PaginatedListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<T> results, int totalCount
});




}
/// @nodoc
class __$PaginatedListResponseCopyWithImpl<T,$Res>
    implements _$PaginatedListResponseCopyWith<T, $Res> {
  __$PaginatedListResponseCopyWithImpl(this._self, this._then);

  final _PaginatedListResponse<T> _self;
  final $Res Function(_PaginatedListResponse<T>) _then;

/// Create a copy of PaginatedListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? totalCount = null,}) {
  return _then(_PaginatedListResponse<T>(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
