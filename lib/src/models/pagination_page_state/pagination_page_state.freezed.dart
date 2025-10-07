// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  List<T> get items;
  Object? get error;
  bool get isLoading;
  int get updateCount;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationPageStateCopyWith<T, PaginationPageState<T>> get copyWith =>
      _$PaginationPageStateCopyWithImpl<T, PaginationPageState<T>>(
          this as PaginationPageState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationPageState<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.updateCount, updateCount) ||
                other.updateCount == updateCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(error),
      isLoading,
      updateCount);

  @override
  String toString() {
    return 'PaginationPageState<$T>(items: $items, error: $error, isLoading: $isLoading, updateCount: $updateCount)';
  }
}

/// @nodoc
abstract mixin class $PaginationPageStateCopyWith<T, $Res> {
  factory $PaginationPageStateCopyWith(PaginationPageState<T> value,
          $Res Function(PaginationPageState<T>) _then) =
      _$PaginationPageStateCopyWithImpl;
  @useResult
  $Res call({List<T> items, Object? error, bool isLoading, int updateCount});
}

/// @nodoc
class _$PaginationPageStateCopyWithImpl<T, $Res>
    implements $PaginationPageStateCopyWith<T, $Res> {
  _$PaginationPageStateCopyWithImpl(this._self, this._then);

  final PaginationPageState<T> _self;
  final $Res Function(PaginationPageState<T>) _then;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? updateCount = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      error: freezed == error ? _self.error : error,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      updateCount: null == updateCount
          ? _self.updateCount
          : updateCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PaginationPageState<T> extends PaginationPageState<T> {
  const _PaginationPageState(
      {final List<T> items = const [],
      this.error,
      this.isLoading = true,
      this.updateCount = 0})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  @JsonKey()
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Object? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int updateCount;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationPageStateCopyWith<T, _PaginationPageState<T>> get copyWith =>
      __$PaginationPageStateCopyWithImpl<T, _PaginationPageState<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationPageState<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.updateCount, updateCount) ||
                other.updateCount == updateCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(error),
      isLoading,
      updateCount);

  @override
  String toString() {
    return 'PaginationPageState<$T>(items: $items, error: $error, isLoading: $isLoading, updateCount: $updateCount)';
  }
}

/// @nodoc
abstract mixin class _$PaginationPageStateCopyWith<T, $Res>
    implements $PaginationPageStateCopyWith<T, $Res> {
  factory _$PaginationPageStateCopyWith(_PaginationPageState<T> value,
          $Res Function(_PaginationPageState<T>) _then) =
      __$PaginationPageStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<T> items, Object? error, bool isLoading, int updateCount});
}

/// @nodoc
class __$PaginationPageStateCopyWithImpl<T, $Res>
    implements _$PaginationPageStateCopyWith<T, $Res> {
  __$PaginationPageStateCopyWithImpl(this._self, this._then);

  final _PaginationPageState<T> _self;
  final $Res Function(_PaginationPageState<T>) _then;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? updateCount = null,
  }) {
    return _then(_PaginationPageState<T>(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      error: freezed == error ? _self.error : error,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      updateCount: null == updateCount
          ? _self.updateCount
          : updateCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
