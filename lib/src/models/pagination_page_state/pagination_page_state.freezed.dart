// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationPageState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  ErrorStackTrace? get errorStackTrace => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get updateCount => throw _privateConstructorUsedError;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationPageStateCopyWith<T, PaginationPageState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationPageStateCopyWith<T, $Res> {
  factory $PaginationPageStateCopyWith(
    PaginationPageState<T> value,
    $Res Function(PaginationPageState<T>) then,
  ) = _$PaginationPageStateCopyWithImpl<T, $Res, PaginationPageState<T>>;
  @useResult
  $Res call({
    List<T> items,
    ErrorStackTrace? errorStackTrace,
    bool isLoading,
    int updateCount,
  });

  $ErrorStackTraceCopyWith<$Res>? get errorStackTrace;
}

/// @nodoc
class _$PaginationPageStateCopyWithImpl<
  T,
  $Res,
  $Val extends PaginationPageState<T>
>
    implements $PaginationPageStateCopyWith<T, $Res> {
  _$PaginationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? errorStackTrace = freezed,
    Object? isLoading = null,
    Object? updateCount = null,
  }) {
    return _then(
      _value.copyWith(
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<T>,
            errorStackTrace:
                freezed == errorStackTrace
                    ? _value.errorStackTrace
                    : errorStackTrace // ignore: cast_nullable_to_non_nullable
                        as ErrorStackTrace?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            updateCount:
                null == updateCount
                    ? _value.updateCount
                    : updateCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorStackTraceCopyWith<$Res>? get errorStackTrace {
    if (_value.errorStackTrace == null) {
      return null;
    }

    return $ErrorStackTraceCopyWith<$Res>(_value.errorStackTrace!, (value) {
      return _then(_value.copyWith(errorStackTrace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginationPageStateImplCopyWith<T, $Res>
    implements $PaginationPageStateCopyWith<T, $Res> {
  factory _$$PaginationPageStateImplCopyWith(
    _$PaginationPageStateImpl<T> value,
    $Res Function(_$PaginationPageStateImpl<T>) then,
  ) = __$$PaginationPageStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    List<T> items,
    ErrorStackTrace? errorStackTrace,
    bool isLoading,
    int updateCount,
  });

  @override
  $ErrorStackTraceCopyWith<$Res>? get errorStackTrace;
}

/// @nodoc
class __$$PaginationPageStateImplCopyWithImpl<T, $Res>
    extends
        _$PaginationPageStateCopyWithImpl<T, $Res, _$PaginationPageStateImpl<T>>
    implements _$$PaginationPageStateImplCopyWith<T, $Res> {
  __$$PaginationPageStateImplCopyWithImpl(
    _$PaginationPageStateImpl<T> _value,
    $Res Function(_$PaginationPageStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? errorStackTrace = freezed,
    Object? isLoading = null,
    Object? updateCount = null,
  }) {
    return _then(
      _$PaginationPageStateImpl<T>(
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<T>,
        errorStackTrace:
            freezed == errorStackTrace
                ? _value.errorStackTrace
                : errorStackTrace // ignore: cast_nullable_to_non_nullable
                    as ErrorStackTrace?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        updateCount:
            null == updateCount
                ? _value.updateCount
                : updateCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$PaginationPageStateImpl<T> extends _PaginationPageState<T> {
  const _$PaginationPageStateImpl({
    final List<T> items = const [],
    this.errorStackTrace,
    this.isLoading = true,
    this.updateCount = 0,
  }) : _items = items,
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
  final ErrorStackTrace? errorStackTrace;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int updateCount;

  @override
  String toString() {
    return 'PaginationPageState<$T>(items: $items, errorStackTrace: $errorStackTrace, isLoading: $isLoading, updateCount: $updateCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationPageStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.errorStackTrace, errorStackTrace) ||
                other.errorStackTrace == errorStackTrace) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.updateCount, updateCount) ||
                other.updateCount == updateCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    errorStackTrace,
    isLoading,
    updateCount,
  );

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationPageStateImplCopyWith<T, _$PaginationPageStateImpl<T>>
  get copyWith =>
      __$$PaginationPageStateImplCopyWithImpl<T, _$PaginationPageStateImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _PaginationPageState<T> extends PaginationPageState<T> {
  const factory _PaginationPageState({
    final List<T> items,
    final ErrorStackTrace? errorStackTrace,
    final bool isLoading,
    final int updateCount,
  }) = _$PaginationPageStateImpl<T>;
  const _PaginationPageState._() : super._();

  @override
  List<T> get items;
  @override
  ErrorStackTrace? get errorStackTrace;
  @override
  bool get isLoading;
  @override
  int get updateCount;

  /// Create a copy of PaginationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationPageStateImplCopyWith<T, _$PaginationPageStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
