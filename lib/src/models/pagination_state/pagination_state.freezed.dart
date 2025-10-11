// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationState<T, Z> {
  Map<int, PaginationPageState<T>> get pageItems;
  List<T> get items;
  Z get loadParams;
  int get totalCount;
  int get limit;
  int get currentPage;
  int get resetTimes;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationStateCopyWith<T, Z, PaginationState<T, Z>> get copyWith =>
      _$PaginationStateCopyWithImpl<T, Z, PaginationState<T, Z>>(
          this as PaginationState<T, Z>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationState<T, Z> &&
            const DeepCollectionEquality().equals(other.pageItems, pageItems) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.loadParams, loadParams) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.resetTimes, resetTimes) ||
                other.resetTimes == resetTimes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageItems),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(loadParams),
      totalCount,
      limit,
      currentPage,
      resetTimes);

  @override
  String toString() {
    return 'PaginationState<$T, $Z>(pageItems: $pageItems, items: $items, loadParams: $loadParams, totalCount: $totalCount, limit: $limit, currentPage: $currentPage, resetTimes: $resetTimes)';
  }
}

/// @nodoc
abstract mixin class $PaginationStateCopyWith<T, Z, $Res> {
  factory $PaginationStateCopyWith(PaginationState<T, Z> value,
          $Res Function(PaginationState<T, Z>) _then) =
      _$PaginationStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<int, PaginationPageState<T>> pageItems,
      List<T> items,
      Z loadParams,
      int totalCount,
      int limit,
      int currentPage,
      int resetTimes});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, Z, $Res>
    implements $PaginationStateCopyWith<T, Z, $Res> {
  _$PaginationStateCopyWithImpl(this._self, this._then);

  final PaginationState<T, Z> _self;
  final $Res Function(PaginationState<T, Z>) _then;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageItems = null,
    Object? items = null,
    Object? loadParams = freezed,
    Object? totalCount = null,
    Object? limit = null,
    Object? currentPage = null,
    Object? resetTimes = null,
  }) {
    return _then(_self.copyWith(
      pageItems: null == pageItems
          ? _self.pageItems
          : pageItems // ignore: cast_nullable_to_non_nullable
              as Map<int, PaginationPageState<T>>,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loadParams: freezed == loadParams
          ? _self.loadParams
          : loadParams // ignore: cast_nullable_to_non_nullable
              as Z,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      resetTimes: null == resetTimes
          ? _self.resetTimes
          : resetTimes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PaginationState<T, Z> implements PaginationState<T, Z> {
  const _PaginationState(
      {required final Map<int, PaginationPageState<T>> pageItems,
      required final List<T> items,
      required this.loadParams,
      required this.totalCount,
      required this.limit,
      this.currentPage = 0,
      this.resetTimes = 0})
      : _pageItems = pageItems,
        _items = items;

  final Map<int, PaginationPageState<T>> _pageItems;
  @override
  Map<int, PaginationPageState<T>> get pageItems {
    if (_pageItems is EqualUnmodifiableMapView) return _pageItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pageItems);
  }

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Z loadParams;
  @override
  final int totalCount;
  @override
  final int limit;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int resetTimes;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationStateCopyWith<T, Z, _PaginationState<T, Z>> get copyWith =>
      __$PaginationStateCopyWithImpl<T, Z, _PaginationState<T, Z>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationState<T, Z> &&
            const DeepCollectionEquality()
                .equals(other._pageItems, _pageItems) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.loadParams, loadParams) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.resetTimes, resetTimes) ||
                other.resetTimes == resetTimes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pageItems),
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(loadParams),
      totalCount,
      limit,
      currentPage,
      resetTimes);

  @override
  String toString() {
    return 'PaginationState<$T, $Z>(pageItems: $pageItems, items: $items, loadParams: $loadParams, totalCount: $totalCount, limit: $limit, currentPage: $currentPage, resetTimes: $resetTimes)';
  }
}

/// @nodoc
abstract mixin class _$PaginationStateCopyWith<T, Z, $Res>
    implements $PaginationStateCopyWith<T, Z, $Res> {
  factory _$PaginationStateCopyWith(_PaginationState<T, Z> value,
          $Res Function(_PaginationState<T, Z>) _then) =
      __$PaginationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<int, PaginationPageState<T>> pageItems,
      List<T> items,
      Z loadParams,
      int totalCount,
      int limit,
      int currentPage,
      int resetTimes});
}

/// @nodoc
class __$PaginationStateCopyWithImpl<T, Z, $Res>
    implements _$PaginationStateCopyWith<T, Z, $Res> {
  __$PaginationStateCopyWithImpl(this._self, this._then);

  final _PaginationState<T, Z> _self;
  final $Res Function(_PaginationState<T, Z>) _then;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageItems = null,
    Object? items = null,
    Object? loadParams = freezed,
    Object? totalCount = null,
    Object? limit = null,
    Object? currentPage = null,
    Object? resetTimes = null,
  }) {
    return _then(_PaginationState<T, Z>(
      pageItems: null == pageItems
          ? _self._pageItems
          : pageItems // ignore: cast_nullable_to_non_nullable
              as Map<int, PaginationPageState<T>>,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loadParams: freezed == loadParams
          ? _self.loadParams
          : loadParams // ignore: cast_nullable_to_non_nullable
              as Z,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      resetTimes: null == resetTimes
          ? _self.resetTimes
          : resetTimes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
