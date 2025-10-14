// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationPageState<T> {

 List<T> get items; Object? get error; bool get isLoading; int get updateCount;
/// Create a copy of PaginationPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationPageStateCopyWith<T, PaginationPageState<T>> get copyWith => _$PaginationPageStateCopyWithImpl<T, PaginationPageState<T>>(this as PaginationPageState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationPageState<T>&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.updateCount, updateCount) || other.updateCount == updateCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(error),isLoading,updateCount);

@override
String toString() {
  return 'PaginationPageState<$T>(items: $items, error: $error, isLoading: $isLoading, updateCount: $updateCount)';
}


}

/// @nodoc
abstract mixin class $PaginationPageStateCopyWith<T,$Res>  {
  factory $PaginationPageStateCopyWith(PaginationPageState<T> value, $Res Function(PaginationPageState<T>) _then) = _$PaginationPageStateCopyWithImpl;
@useResult
$Res call({
 List<T> items, Object? error, bool isLoading, int updateCount
});




}
/// @nodoc
class _$PaginationPageStateCopyWithImpl<T,$Res>
    implements $PaginationPageStateCopyWith<T, $Res> {
  _$PaginationPageStateCopyWithImpl(this._self, this._then);

  final PaginationPageState<T> _self;
  final $Res Function(PaginationPageState<T>) _then;

/// Create a copy of PaginationPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? error = freezed,Object? isLoading = null,Object? updateCount = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error ,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,updateCount: null == updateCount ? _self.updateCount : updateCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationPageState].
extension PaginationPageStatePatterns<T> on PaginationPageState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationPageState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationPageState<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginationPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationPageState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  Object? error,  bool isLoading,  int updateCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationPageState() when $default != null:
return $default(_that.items,_that.error,_that.isLoading,_that.updateCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  Object? error,  bool isLoading,  int updateCount)  $default,) {final _that = this;
switch (_that) {
case _PaginationPageState():
return $default(_that.items,_that.error,_that.isLoading,_that.updateCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  Object? error,  bool isLoading,  int updateCount)?  $default,) {final _that = this;
switch (_that) {
case _PaginationPageState() when $default != null:
return $default(_that.items,_that.error,_that.isLoading,_that.updateCount);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationPageState<T> extends PaginationPageState<T> {
  const _PaginationPageState({final  List<T> items = const [], this.error, this.isLoading = true, this.updateCount = 0}): _items = items,super._();
  

 final  List<T> _items;
@override@JsonKey() List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Object? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int updateCount;

/// Create a copy of PaginationPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationPageStateCopyWith<T, _PaginationPageState<T>> get copyWith => __$PaginationPageStateCopyWithImpl<T, _PaginationPageState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationPageState<T>&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.updateCount, updateCount) || other.updateCount == updateCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(error),isLoading,updateCount);

@override
String toString() {
  return 'PaginationPageState<$T>(items: $items, error: $error, isLoading: $isLoading, updateCount: $updateCount)';
}


}

/// @nodoc
abstract mixin class _$PaginationPageStateCopyWith<T,$Res> implements $PaginationPageStateCopyWith<T, $Res> {
  factory _$PaginationPageStateCopyWith(_PaginationPageState<T> value, $Res Function(_PaginationPageState<T>) _then) = __$PaginationPageStateCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, Object? error, bool isLoading, int updateCount
});




}
/// @nodoc
class __$PaginationPageStateCopyWithImpl<T,$Res>
    implements _$PaginationPageStateCopyWith<T, $Res> {
  __$PaginationPageStateCopyWithImpl(this._self, this._then);

  final _PaginationPageState<T> _self;
  final $Res Function(_PaginationPageState<T>) _then;

/// Create a copy of PaginationPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? error = freezed,Object? isLoading = null,Object? updateCount = null,}) {
  return _then(_PaginationPageState<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error ,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,updateCount: null == updateCount ? _self.updateCount : updateCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
