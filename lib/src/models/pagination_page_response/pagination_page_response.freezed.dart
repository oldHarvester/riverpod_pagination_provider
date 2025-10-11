// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationPageResponse<T> {

 PaginationPageState<T> get page; int get totalCount;
/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationPageResponseCopyWith<T, PaginationPageResponse<T>> get copyWith => _$PaginationPageResponseCopyWithImpl<T, PaginationPageResponse<T>>(this as PaginationPageResponse<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationPageResponse<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,page,totalCount);

@override
String toString() {
  return 'PaginationPageResponse<$T>(page: $page, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $PaginationPageResponseCopyWith<T,$Res>  {
  factory $PaginationPageResponseCopyWith(PaginationPageResponse<T> value, $Res Function(PaginationPageResponse<T>) _then) = _$PaginationPageResponseCopyWithImpl;
@useResult
$Res call({
 PaginationPageState<T> page, int totalCount
});


$PaginationPageStateCopyWith<T, $Res> get page;

}
/// @nodoc
class _$PaginationPageResponseCopyWithImpl<T,$Res>
    implements $PaginationPageResponseCopyWith<T, $Res> {
  _$PaginationPageResponseCopyWithImpl(this._self, this._then);

  final PaginationPageResponse<T> _self;
  final $Res Function(PaginationPageResponse<T>) _then;

/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as PaginationPageState<T>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationPageStateCopyWith<T, $Res> get page {
  
  return $PaginationPageStateCopyWith<T, $Res>(_self.page, (value) {
    return _then(_self.copyWith(page: value));
  });
}
}


/// @nodoc


class _PaginationPageResponse<T> implements PaginationPageResponse<T> {
  const _PaginationPageResponse({required this.page, required this.totalCount});
  

@override final  PaginationPageState<T> page;
@override final  int totalCount;

/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationPageResponseCopyWith<T, _PaginationPageResponse<T>> get copyWith => __$PaginationPageResponseCopyWithImpl<T, _PaginationPageResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationPageResponse<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,page,totalCount);

@override
String toString() {
  return 'PaginationPageResponse<$T>(page: $page, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$PaginationPageResponseCopyWith<T,$Res> implements $PaginationPageResponseCopyWith<T, $Res> {
  factory _$PaginationPageResponseCopyWith(_PaginationPageResponse<T> value, $Res Function(_PaginationPageResponse<T>) _then) = __$PaginationPageResponseCopyWithImpl;
@override @useResult
$Res call({
 PaginationPageState<T> page, int totalCount
});


@override $PaginationPageStateCopyWith<T, $Res> get page;

}
/// @nodoc
class __$PaginationPageResponseCopyWithImpl<T,$Res>
    implements _$PaginationPageResponseCopyWith<T, $Res> {
  __$PaginationPageResponseCopyWithImpl(this._self, this._then);

  final _PaginationPageResponse<T> _self;
  final $Res Function(_PaginationPageResponse<T>) _then;

/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalCount = null,}) {
  return _then(_PaginationPageResponse<T>(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as PaginationPageState<T>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PaginationPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationPageStateCopyWith<T, $Res> get page {
  
  return $PaginationPageStateCopyWith<T, $Res>(_self.page, (value) {
    return _then(_self.copyWith(page: value));
  });
}
}

// dart format on
