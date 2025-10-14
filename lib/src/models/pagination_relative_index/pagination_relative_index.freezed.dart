// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_relative_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationRelativeIndex {

 int get page; double get pageProgress; double get totalProgress; int get relativeIndex; int get absoluteIndex;
/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationRelativeIndexCopyWith<PaginationRelativeIndex> get copyWith => _$PaginationRelativeIndexCopyWithImpl<PaginationRelativeIndex>(this as PaginationRelativeIndex, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationRelativeIndex&&(identical(other.page, page) || other.page == page)&&(identical(other.pageProgress, pageProgress) || other.pageProgress == pageProgress)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.relativeIndex, relativeIndex) || other.relativeIndex == relativeIndex)&&(identical(other.absoluteIndex, absoluteIndex) || other.absoluteIndex == absoluteIndex));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageProgress,totalProgress,relativeIndex,absoluteIndex);

@override
String toString() {
  return 'PaginationRelativeIndex(page: $page, pageProgress: $pageProgress, totalProgress: $totalProgress, relativeIndex: $relativeIndex, absoluteIndex: $absoluteIndex)';
}


}

/// @nodoc
abstract mixin class $PaginationRelativeIndexCopyWith<$Res>  {
  factory $PaginationRelativeIndexCopyWith(PaginationRelativeIndex value, $Res Function(PaginationRelativeIndex) _then) = _$PaginationRelativeIndexCopyWithImpl;
@useResult
$Res call({
 int page, double pageProgress, double totalProgress, int relativeIndex, int absoluteIndex
});




}
/// @nodoc
class _$PaginationRelativeIndexCopyWithImpl<$Res>
    implements $PaginationRelativeIndexCopyWith<$Res> {
  _$PaginationRelativeIndexCopyWithImpl(this._self, this._then);

  final PaginationRelativeIndex _self;
  final $Res Function(PaginationRelativeIndex) _then;

/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageProgress = null,Object? totalProgress = null,Object? relativeIndex = null,Object? absoluteIndex = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageProgress: null == pageProgress ? _self.pageProgress : pageProgress // ignore: cast_nullable_to_non_nullable
as double,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as double,relativeIndex: null == relativeIndex ? _self.relativeIndex : relativeIndex // ignore: cast_nullable_to_non_nullable
as int,absoluteIndex: null == absoluteIndex ? _self.absoluteIndex : absoluteIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationRelativeIndex].
extension PaginationRelativeIndexPatterns on PaginationRelativeIndex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationRelativeIndex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationRelativeIndex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationRelativeIndex value)  $default,){
final _that = this;
switch (_that) {
case _PaginationRelativeIndex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationRelativeIndex value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationRelativeIndex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  double pageProgress,  double totalProgress,  int relativeIndex,  int absoluteIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationRelativeIndex() when $default != null:
return $default(_that.page,_that.pageProgress,_that.totalProgress,_that.relativeIndex,_that.absoluteIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  double pageProgress,  double totalProgress,  int relativeIndex,  int absoluteIndex)  $default,) {final _that = this;
switch (_that) {
case _PaginationRelativeIndex():
return $default(_that.page,_that.pageProgress,_that.totalProgress,_that.relativeIndex,_that.absoluteIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  double pageProgress,  double totalProgress,  int relativeIndex,  int absoluteIndex)?  $default,) {final _that = this;
switch (_that) {
case _PaginationRelativeIndex() when $default != null:
return $default(_that.page,_that.pageProgress,_that.totalProgress,_that.relativeIndex,_that.absoluteIndex);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationRelativeIndex implements PaginationRelativeIndex {
  const _PaginationRelativeIndex({required this.page, required this.pageProgress, required this.totalProgress, required this.relativeIndex, required this.absoluteIndex});
  

@override final  int page;
@override final  double pageProgress;
@override final  double totalProgress;
@override final  int relativeIndex;
@override final  int absoluteIndex;

/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationRelativeIndexCopyWith<_PaginationRelativeIndex> get copyWith => __$PaginationRelativeIndexCopyWithImpl<_PaginationRelativeIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationRelativeIndex&&(identical(other.page, page) || other.page == page)&&(identical(other.pageProgress, pageProgress) || other.pageProgress == pageProgress)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.relativeIndex, relativeIndex) || other.relativeIndex == relativeIndex)&&(identical(other.absoluteIndex, absoluteIndex) || other.absoluteIndex == absoluteIndex));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageProgress,totalProgress,relativeIndex,absoluteIndex);

@override
String toString() {
  return 'PaginationRelativeIndex(page: $page, pageProgress: $pageProgress, totalProgress: $totalProgress, relativeIndex: $relativeIndex, absoluteIndex: $absoluteIndex)';
}


}

/// @nodoc
abstract mixin class _$PaginationRelativeIndexCopyWith<$Res> implements $PaginationRelativeIndexCopyWith<$Res> {
  factory _$PaginationRelativeIndexCopyWith(_PaginationRelativeIndex value, $Res Function(_PaginationRelativeIndex) _then) = __$PaginationRelativeIndexCopyWithImpl;
@override @useResult
$Res call({
 int page, double pageProgress, double totalProgress, int relativeIndex, int absoluteIndex
});




}
/// @nodoc
class __$PaginationRelativeIndexCopyWithImpl<$Res>
    implements _$PaginationRelativeIndexCopyWith<$Res> {
  __$PaginationRelativeIndexCopyWithImpl(this._self, this._then);

  final _PaginationRelativeIndex _self;
  final $Res Function(_PaginationRelativeIndex) _then;

/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageProgress = null,Object? totalProgress = null,Object? relativeIndex = null,Object? absoluteIndex = null,}) {
  return _then(_PaginationRelativeIndex(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageProgress: null == pageProgress ? _self.pageProgress : pageProgress // ignore: cast_nullable_to_non_nullable
as double,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as double,relativeIndex: null == relativeIndex ? _self.relativeIndex : relativeIndex // ignore: cast_nullable_to_non_nullable
as int,absoluteIndex: null == absoluteIndex ? _self.absoluteIndex : absoluteIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
