// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 int get page; double get pageProgress; double get totalProgress; int get index;
/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationRelativeIndexCopyWith<PaginationRelativeIndex> get copyWith => _$PaginationRelativeIndexCopyWithImpl<PaginationRelativeIndex>(this as PaginationRelativeIndex, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationRelativeIndex&&(identical(other.page, page) || other.page == page)&&(identical(other.pageProgress, pageProgress) || other.pageProgress == pageProgress)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageProgress,totalProgress,index);

@override
String toString() {
  return 'PaginationRelativeIndex(page: $page, pageProgress: $pageProgress, totalProgress: $totalProgress, index: $index)';
}


}

/// @nodoc
abstract mixin class $PaginationRelativeIndexCopyWith<$Res>  {
  factory $PaginationRelativeIndexCopyWith(PaginationRelativeIndex value, $Res Function(PaginationRelativeIndex) _then) = _$PaginationRelativeIndexCopyWithImpl;
@useResult
$Res call({
 int page, double pageProgress, double totalProgress, int index
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
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageProgress = null,Object? totalProgress = null,Object? index = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageProgress: null == pageProgress ? _self.pageProgress : pageProgress // ignore: cast_nullable_to_non_nullable
as double,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as double,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _PaginationRelativeIndex implements PaginationRelativeIndex {
  const _PaginationRelativeIndex({required this.page, required this.pageProgress, required this.totalProgress, required this.index});
  

@override final  int page;
@override final  double pageProgress;
@override final  double totalProgress;
@override final  int index;

/// Create a copy of PaginationRelativeIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationRelativeIndexCopyWith<_PaginationRelativeIndex> get copyWith => __$PaginationRelativeIndexCopyWithImpl<_PaginationRelativeIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationRelativeIndex&&(identical(other.page, page) || other.page == page)&&(identical(other.pageProgress, pageProgress) || other.pageProgress == pageProgress)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageProgress,totalProgress,index);

@override
String toString() {
  return 'PaginationRelativeIndex(page: $page, pageProgress: $pageProgress, totalProgress: $totalProgress, index: $index)';
}


}

/// @nodoc
abstract mixin class _$PaginationRelativeIndexCopyWith<$Res> implements $PaginationRelativeIndexCopyWith<$Res> {
  factory _$PaginationRelativeIndexCopyWith(_PaginationRelativeIndex value, $Res Function(_PaginationRelativeIndex) _then) = __$PaginationRelativeIndexCopyWithImpl;
@override @useResult
$Res call({
 int page, double pageProgress, double totalProgress, int index
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
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageProgress = null,Object? totalProgress = null,Object? index = null,}) {
  return _then(_PaginationRelativeIndex(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageProgress: null == pageProgress ? _self.pageProgress : pageProgress // ignore: cast_nullable_to_non_nullable
as double,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as double,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
