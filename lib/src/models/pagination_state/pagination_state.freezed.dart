// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationState<T,Z,Y> {

 Map<int, PaginationPageState<T>> get pageItems; List<T> get items; Z get loadParams; Y? get extraArgs; int get totalCount; int get limit; int get initialPage; int get currentPage; int get resetTimes;
/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationStateCopyWith<T, Z, Y, PaginationState<T, Z, Y>> get copyWith => _$PaginationStateCopyWithImpl<T, Z, Y, PaginationState<T, Z, Y>>(this as PaginationState<T, Z, Y>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationState<T, Z, Y>&&const DeepCollectionEquality().equals(other.pageItems, pageItems)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.loadParams, loadParams)&&const DeepCollectionEquality().equals(other.extraArgs, extraArgs)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.initialPage, initialPage) || other.initialPage == initialPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.resetTimes, resetTimes) || other.resetTimes == resetTimes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pageItems),const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(loadParams),const DeepCollectionEquality().hash(extraArgs),totalCount,limit,initialPage,currentPage,resetTimes);

@override
String toString() {
  return 'PaginationState<$T, $Z, $Y>(pageItems: $pageItems, items: $items, loadParams: $loadParams, extraArgs: $extraArgs, totalCount: $totalCount, limit: $limit, initialPage: $initialPage, currentPage: $currentPage, resetTimes: $resetTimes)';
}


}

/// @nodoc
abstract mixin class $PaginationStateCopyWith<T,Z,Y,$Res>  {
  factory $PaginationStateCopyWith(PaginationState<T, Z, Y> value, $Res Function(PaginationState<T, Z, Y>) _then) = _$PaginationStateCopyWithImpl;
@useResult
$Res call({
 Map<int, PaginationPageState<T>> pageItems, List<T> items, Z loadParams, Y? extraArgs, int totalCount, int limit, int initialPage, int currentPage, int resetTimes
});




}
/// @nodoc
class _$PaginationStateCopyWithImpl<T,Z,Y,$Res>
    implements $PaginationStateCopyWith<T, Z, Y, $Res> {
  _$PaginationStateCopyWithImpl(this._self, this._then);

  final PaginationState<T, Z, Y> _self;
  final $Res Function(PaginationState<T, Z, Y>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageItems = null,Object? items = null,Object? loadParams = freezed,Object? extraArgs = freezed,Object? totalCount = null,Object? limit = null,Object? initialPage = null,Object? currentPage = null,Object? resetTimes = null,}) {
  return _then(_self.copyWith(
pageItems: null == pageItems ? _self.pageItems : pageItems // ignore: cast_nullable_to_non_nullable
as Map<int, PaginationPageState<T>>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,loadParams: freezed == loadParams ? _self.loadParams : loadParams // ignore: cast_nullable_to_non_nullable
as Z,extraArgs: freezed == extraArgs ? _self.extraArgs : extraArgs // ignore: cast_nullable_to_non_nullable
as Y?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,initialPage: null == initialPage ? _self.initialPage : initialPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,resetTimes: null == resetTimes ? _self.resetTimes : resetTimes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationState].
extension PaginationStatePatterns<T,Z,Y> on PaginationState<T, Z, Y> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationState<T, Z, Y> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationState<T, Z, Y> value)  $default,){
final _that = this;
switch (_that) {
case _PaginationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationState<T, Z, Y> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, PaginationPageState<T>> pageItems,  List<T> items,  Z loadParams,  Y? extraArgs,  int totalCount,  int limit,  int initialPage,  int currentPage,  int resetTimes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that.pageItems,_that.items,_that.loadParams,_that.extraArgs,_that.totalCount,_that.limit,_that.initialPage,_that.currentPage,_that.resetTimes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, PaginationPageState<T>> pageItems,  List<T> items,  Z loadParams,  Y? extraArgs,  int totalCount,  int limit,  int initialPage,  int currentPage,  int resetTimes)  $default,) {final _that = this;
switch (_that) {
case _PaginationState():
return $default(_that.pageItems,_that.items,_that.loadParams,_that.extraArgs,_that.totalCount,_that.limit,_that.initialPage,_that.currentPage,_that.resetTimes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, PaginationPageState<T>> pageItems,  List<T> items,  Z loadParams,  Y? extraArgs,  int totalCount,  int limit,  int initialPage,  int currentPage,  int resetTimes)?  $default,) {final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that.pageItems,_that.items,_that.loadParams,_that.extraArgs,_that.totalCount,_that.limit,_that.initialPage,_that.currentPage,_that.resetTimes);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationState<T,Z,Y> extends PaginationState<T, Z, Y> {
  const _PaginationState({required final  Map<int, PaginationPageState<T>> pageItems, required final  List<T> items, required this.loadParams, this.extraArgs, required this.totalCount, required this.limit, required this.initialPage, this.currentPage = 0, this.resetTimes = 0}): _pageItems = pageItems,_items = items,super._();
  

 final  Map<int, PaginationPageState<T>> _pageItems;
@override Map<int, PaginationPageState<T>> get pageItems {
  if (_pageItems is EqualUnmodifiableMapView) return _pageItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pageItems);
}

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Z loadParams;
@override final  Y? extraArgs;
@override final  int totalCount;
@override final  int limit;
@override final  int initialPage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int resetTimes;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationStateCopyWith<T, Z, Y, _PaginationState<T, Z, Y>> get copyWith => __$PaginationStateCopyWithImpl<T, Z, Y, _PaginationState<T, Z, Y>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationState<T, Z, Y>&&const DeepCollectionEquality().equals(other._pageItems, _pageItems)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other.loadParams, loadParams)&&const DeepCollectionEquality().equals(other.extraArgs, extraArgs)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.initialPage, initialPage) || other.initialPage == initialPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.resetTimes, resetTimes) || other.resetTimes == resetTimes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pageItems),const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(loadParams),const DeepCollectionEquality().hash(extraArgs),totalCount,limit,initialPage,currentPage,resetTimes);

@override
String toString() {
  return 'PaginationState<$T, $Z, $Y>(pageItems: $pageItems, items: $items, loadParams: $loadParams, extraArgs: $extraArgs, totalCount: $totalCount, limit: $limit, initialPage: $initialPage, currentPage: $currentPage, resetTimes: $resetTimes)';
}


}

/// @nodoc
abstract mixin class _$PaginationStateCopyWith<T,Z,Y,$Res> implements $PaginationStateCopyWith<T, Z, Y, $Res> {
  factory _$PaginationStateCopyWith(_PaginationState<T, Z, Y> value, $Res Function(_PaginationState<T, Z, Y>) _then) = __$PaginationStateCopyWithImpl;
@override @useResult
$Res call({
 Map<int, PaginationPageState<T>> pageItems, List<T> items, Z loadParams, Y? extraArgs, int totalCount, int limit, int initialPage, int currentPage, int resetTimes
});




}
/// @nodoc
class __$PaginationStateCopyWithImpl<T,Z,Y,$Res>
    implements _$PaginationStateCopyWith<T, Z, Y, $Res> {
  __$PaginationStateCopyWithImpl(this._self, this._then);

  final _PaginationState<T, Z, Y> _self;
  final $Res Function(_PaginationState<T, Z, Y>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageItems = null,Object? items = null,Object? loadParams = freezed,Object? extraArgs = freezed,Object? totalCount = null,Object? limit = null,Object? initialPage = null,Object? currentPage = null,Object? resetTimes = null,}) {
  return _then(_PaginationState<T, Z, Y>(
pageItems: null == pageItems ? _self._pageItems : pageItems // ignore: cast_nullable_to_non_nullable
as Map<int, PaginationPageState<T>>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,loadParams: freezed == loadParams ? _self.loadParams : loadParams // ignore: cast_nullable_to_non_nullable
as Z,extraArgs: freezed == extraArgs ? _self.extraArgs : extraArgs // ignore: cast_nullable_to_non_nullable
as Y?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,initialPage: null == initialPage ? _self.initialPage : initialPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,resetTimes: null == resetTimes ? _self.resetTimes : resetTimes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
