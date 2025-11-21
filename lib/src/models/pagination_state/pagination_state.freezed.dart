// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationState<T, Z, Y> {
  Map<int, PaginationPageState<T>> get pageItems =>
      throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;
  List<T?> get mixedItems => throw _privateConstructorUsedError;
  Z get loadParams => throw _privateConstructorUsedError;
  Y? get extraArgs => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get initialPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get resetTimes => throw _privateConstructorUsedError;
  bool get initialLoading => throw _privateConstructorUsedError;
  bool get initialLoaded => throw _privateConstructorUsedError;
  bool get refreshing => throw _privateConstructorUsedError;
  ErrorStackTrace? get initialError => throw _privateConstructorUsedError;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationStateCopyWith<T, Z, Y, PaginationState<T, Z, Y>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, Z, Y, $Res> {
  factory $PaginationStateCopyWith(
    PaginationState<T, Z, Y> value,
    $Res Function(PaginationState<T, Z, Y>) then,
  ) = _$PaginationStateCopyWithImpl<T, Z, Y, $Res, PaginationState<T, Z, Y>>;
  @useResult
  $Res call({
    Map<int, PaginationPageState<T>> pageItems,
    List<T> items,
    List<T?> mixedItems,
    Z loadParams,
    Y? extraArgs,
    int totalCount,
    int limit,
    int initialPage,
    int currentPage,
    int resetTimes,
    bool initialLoading,
    bool initialLoaded,
    bool refreshing,
    ErrorStackTrace? initialError,
  });

  $ErrorStackTraceCopyWith<$Res>? get initialError;
}

/// @nodoc
class _$PaginationStateCopyWithImpl<
  T,
  Z,
  Y,
  $Res,
  $Val extends PaginationState<T, Z, Y>
>
    implements $PaginationStateCopyWith<T, Z, Y, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageItems = null,
    Object? items = null,
    Object? mixedItems = null,
    Object? loadParams = freezed,
    Object? extraArgs = freezed,
    Object? totalCount = null,
    Object? limit = null,
    Object? initialPage = null,
    Object? currentPage = null,
    Object? resetTimes = null,
    Object? initialLoading = null,
    Object? initialLoaded = null,
    Object? refreshing = null,
    Object? initialError = freezed,
  }) {
    return _then(
      _value.copyWith(
            pageItems:
                null == pageItems
                    ? _value.pageItems
                    : pageItems // ignore: cast_nullable_to_non_nullable
                        as Map<int, PaginationPageState<T>>,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<T>,
            mixedItems:
                null == mixedItems
                    ? _value.mixedItems
                    : mixedItems // ignore: cast_nullable_to_non_nullable
                        as List<T?>,
            loadParams:
                freezed == loadParams
                    ? _value.loadParams
                    : loadParams // ignore: cast_nullable_to_non_nullable
                        as Z,
            extraArgs:
                freezed == extraArgs
                    ? _value.extraArgs
                    : extraArgs // ignore: cast_nullable_to_non_nullable
                        as Y?,
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int,
            limit:
                null == limit
                    ? _value.limit
                    : limit // ignore: cast_nullable_to_non_nullable
                        as int,
            initialPage:
                null == initialPage
                    ? _value.initialPage
                    : initialPage // ignore: cast_nullable_to_non_nullable
                        as int,
            currentPage:
                null == currentPage
                    ? _value.currentPage
                    : currentPage // ignore: cast_nullable_to_non_nullable
                        as int,
            resetTimes:
                null == resetTimes
                    ? _value.resetTimes
                    : resetTimes // ignore: cast_nullable_to_non_nullable
                        as int,
            initialLoading:
                null == initialLoading
                    ? _value.initialLoading
                    : initialLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            initialLoaded:
                null == initialLoaded
                    ? _value.initialLoaded
                    : initialLoaded // ignore: cast_nullable_to_non_nullable
                        as bool,
            refreshing:
                null == refreshing
                    ? _value.refreshing
                    : refreshing // ignore: cast_nullable_to_non_nullable
                        as bool,
            initialError:
                freezed == initialError
                    ? _value.initialError
                    : initialError // ignore: cast_nullable_to_non_nullable
                        as ErrorStackTrace?,
          )
          as $Val,
    );
  }

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorStackTraceCopyWith<$Res>? get initialError {
    if (_value.initialError == null) {
      return null;
    }

    return $ErrorStackTraceCopyWith<$Res>(_value.initialError!, (value) {
      return _then(_value.copyWith(initialError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginationStateImplCopyWith<T, Z, Y, $Res>
    implements $PaginationStateCopyWith<T, Z, Y, $Res> {
  factory _$$PaginationStateImplCopyWith(
    _$PaginationStateImpl<T, Z, Y> value,
    $Res Function(_$PaginationStateImpl<T, Z, Y>) then,
  ) = __$$PaginationStateImplCopyWithImpl<T, Z, Y, $Res>;
  @override
  @useResult
  $Res call({
    Map<int, PaginationPageState<T>> pageItems,
    List<T> items,
    List<T?> mixedItems,
    Z loadParams,
    Y? extraArgs,
    int totalCount,
    int limit,
    int initialPage,
    int currentPage,
    int resetTimes,
    bool initialLoading,
    bool initialLoaded,
    bool refreshing,
    ErrorStackTrace? initialError,
  });

  @override
  $ErrorStackTraceCopyWith<$Res>? get initialError;
}

/// @nodoc
class __$$PaginationStateImplCopyWithImpl<T, Z, Y, $Res>
    extends
        _$PaginationStateCopyWithImpl<
          T,
          Z,
          Y,
          $Res,
          _$PaginationStateImpl<T, Z, Y>
        >
    implements _$$PaginationStateImplCopyWith<T, Z, Y, $Res> {
  __$$PaginationStateImplCopyWithImpl(
    _$PaginationStateImpl<T, Z, Y> _value,
    $Res Function(_$PaginationStateImpl<T, Z, Y>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageItems = null,
    Object? items = null,
    Object? mixedItems = null,
    Object? loadParams = freezed,
    Object? extraArgs = freezed,
    Object? totalCount = null,
    Object? limit = null,
    Object? initialPage = null,
    Object? currentPage = null,
    Object? resetTimes = null,
    Object? initialLoading = null,
    Object? initialLoaded = null,
    Object? refreshing = null,
    Object? initialError = freezed,
  }) {
    return _then(
      _$PaginationStateImpl<T, Z, Y>(
        pageItems:
            null == pageItems
                ? _value._pageItems
                : pageItems // ignore: cast_nullable_to_non_nullable
                    as Map<int, PaginationPageState<T>>,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<T>,
        mixedItems:
            null == mixedItems
                ? _value._mixedItems
                : mixedItems // ignore: cast_nullable_to_non_nullable
                    as List<T?>,
        loadParams:
            freezed == loadParams
                ? _value.loadParams
                : loadParams // ignore: cast_nullable_to_non_nullable
                    as Z,
        extraArgs:
            freezed == extraArgs
                ? _value.extraArgs
                : extraArgs // ignore: cast_nullable_to_non_nullable
                    as Y?,
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int,
        limit:
            null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                    as int,
        initialPage:
            null == initialPage
                ? _value.initialPage
                : initialPage // ignore: cast_nullable_to_non_nullable
                    as int,
        currentPage:
            null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                    as int,
        resetTimes:
            null == resetTimes
                ? _value.resetTimes
                : resetTimes // ignore: cast_nullable_to_non_nullable
                    as int,
        initialLoading:
            null == initialLoading
                ? _value.initialLoading
                : initialLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        initialLoaded:
            null == initialLoaded
                ? _value.initialLoaded
                : initialLoaded // ignore: cast_nullable_to_non_nullable
                    as bool,
        refreshing:
            null == refreshing
                ? _value.refreshing
                : refreshing // ignore: cast_nullable_to_non_nullable
                    as bool,
        initialError:
            freezed == initialError
                ? _value.initialError
                : initialError // ignore: cast_nullable_to_non_nullable
                    as ErrorStackTrace?,
      ),
    );
  }
}

/// @nodoc

class _$PaginationStateImpl<T, Z, Y> extends _PaginationState<T, Z, Y> {
  const _$PaginationStateImpl({
    required final Map<int, PaginationPageState<T>> pageItems,
    required final List<T> items,
    required final List<T?> mixedItems,
    required this.loadParams,
    this.extraArgs,
    required this.totalCount,
    required this.limit,
    required this.initialPage,
    this.currentPage = 0,
    this.resetTimes = 0,
    required this.initialLoading,
    required this.initialLoaded,
    required this.refreshing,
    this.initialError,
  }) : _pageItems = pageItems,
       _items = items,
       _mixedItems = mixedItems,
       super._();

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

  final List<T?> _mixedItems;
  @override
  List<T?> get mixedItems {
    if (_mixedItems is EqualUnmodifiableListView) return _mixedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mixedItems);
  }

  @override
  final Z loadParams;
  @override
  final Y? extraArgs;
  @override
  final int totalCount;
  @override
  final int limit;
  @override
  final int initialPage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int resetTimes;
  @override
  final bool initialLoading;
  @override
  final bool initialLoaded;
  @override
  final bool refreshing;
  @override
  final ErrorStackTrace? initialError;

  @override
  String toString() {
    return 'PaginationState<$T, $Z, $Y>(pageItems: $pageItems, items: $items, mixedItems: $mixedItems, loadParams: $loadParams, extraArgs: $extraArgs, totalCount: $totalCount, limit: $limit, initialPage: $initialPage, currentPage: $currentPage, resetTimes: $resetTimes, initialLoading: $initialLoading, initialLoaded: $initialLoaded, refreshing: $refreshing, initialError: $initialError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationStateImpl<T, Z, Y> &&
            const DeepCollectionEquality().equals(
              other._pageItems,
              _pageItems,
            ) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._mixedItems,
              _mixedItems,
            ) &&
            const DeepCollectionEquality().equals(
              other.loadParams,
              loadParams,
            ) &&
            const DeepCollectionEquality().equals(other.extraArgs, extraArgs) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.initialPage, initialPage) ||
                other.initialPage == initialPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.resetTimes, resetTimes) ||
                other.resetTimes == resetTimes) &&
            (identical(other.initialLoading, initialLoading) ||
                other.initialLoading == initialLoading) &&
            (identical(other.initialLoaded, initialLoaded) ||
                other.initialLoaded == initialLoaded) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            (identical(other.initialError, initialError) ||
                other.initialError == initialError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pageItems),
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_mixedItems),
    const DeepCollectionEquality().hash(loadParams),
    const DeepCollectionEquality().hash(extraArgs),
    totalCount,
    limit,
    initialPage,
    currentPage,
    resetTimes,
    initialLoading,
    initialLoaded,
    refreshing,
    initialError,
  );

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationStateImplCopyWith<T, Z, Y, _$PaginationStateImpl<T, Z, Y>>
  get copyWith => __$$PaginationStateImplCopyWithImpl<
    T,
    Z,
    Y,
    _$PaginationStateImpl<T, Z, Y>
  >(this, _$identity);
}

abstract class _PaginationState<T, Z, Y> extends PaginationState<T, Z, Y> {
  const factory _PaginationState({
    required final Map<int, PaginationPageState<T>> pageItems,
    required final List<T> items,
    required final List<T?> mixedItems,
    required final Z loadParams,
    final Y? extraArgs,
    required final int totalCount,
    required final int limit,
    required final int initialPage,
    final int currentPage,
    final int resetTimes,
    required final bool initialLoading,
    required final bool initialLoaded,
    required final bool refreshing,
    final ErrorStackTrace? initialError,
  }) = _$PaginationStateImpl<T, Z, Y>;
  const _PaginationState._() : super._();

  @override
  Map<int, PaginationPageState<T>> get pageItems;
  @override
  List<T> get items;
  @override
  List<T?> get mixedItems;
  @override
  Z get loadParams;
  @override
  Y? get extraArgs;
  @override
  int get totalCount;
  @override
  int get limit;
  @override
  int get initialPage;
  @override
  int get currentPage;
  @override
  int get resetTimes;
  @override
  bool get initialLoading;
  @override
  bool get initialLoaded;
  @override
  bool get refreshing;
  @override
  ErrorStackTrace? get initialError;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationStateImplCopyWith<T, Z, Y, _$PaginationStateImpl<T, Z, Y>>
  get copyWith => throw _privateConstructorUsedError;
}
