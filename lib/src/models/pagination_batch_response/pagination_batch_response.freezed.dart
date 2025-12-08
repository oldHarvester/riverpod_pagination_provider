// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationBatchResponse<T> {
  Map<int, List<T>> get pageItems => throw _privateConstructorUsedError;
  ErrorStackTrace? get errorStacktrace => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get cancelled => throw _privateConstructorUsedError;

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationBatchResponseCopyWith<T, PaginationBatchResponse<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationBatchResponseCopyWith<T, $Res> {
  factory $PaginationBatchResponseCopyWith(
    PaginationBatchResponse<T> value,
    $Res Function(PaginationBatchResponse<T>) then,
  ) =
      _$PaginationBatchResponseCopyWithImpl<
        T,
        $Res,
        PaginationBatchResponse<T>
      >;
  @useResult
  $Res call({
    Map<int, List<T>> pageItems,
    ErrorStackTrace? errorStacktrace,
    int totalCount,
    bool cancelled,
  });

  $ErrorStackTraceCopyWith<$Res>? get errorStacktrace;
}

/// @nodoc
class _$PaginationBatchResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginationBatchResponse<T>
>
    implements $PaginationBatchResponseCopyWith<T, $Res> {
  _$PaginationBatchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageItems = null,
    Object? errorStacktrace = freezed,
    Object? totalCount = null,
    Object? cancelled = null,
  }) {
    return _then(
      _value.copyWith(
            pageItems:
                null == pageItems
                    ? _value.pageItems
                    : pageItems // ignore: cast_nullable_to_non_nullable
                        as Map<int, List<T>>,
            errorStacktrace:
                freezed == errorStacktrace
                    ? _value.errorStacktrace
                    : errorStacktrace // ignore: cast_nullable_to_non_nullable
                        as ErrorStackTrace?,
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int,
            cancelled:
                null == cancelled
                    ? _value.cancelled
                    : cancelled // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorStackTraceCopyWith<$Res>? get errorStacktrace {
    if (_value.errorStacktrace == null) {
      return null;
    }

    return $ErrorStackTraceCopyWith<$Res>(_value.errorStacktrace!, (value) {
      return _then(_value.copyWith(errorStacktrace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginationBatchResponseImplCopyWith<T, $Res>
    implements $PaginationBatchResponseCopyWith<T, $Res> {
  factory _$$PaginationBatchResponseImplCopyWith(
    _$PaginationBatchResponseImpl<T> value,
    $Res Function(_$PaginationBatchResponseImpl<T>) then,
  ) = __$$PaginationBatchResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    Map<int, List<T>> pageItems,
    ErrorStackTrace? errorStacktrace,
    int totalCount,
    bool cancelled,
  });

  @override
  $ErrorStackTraceCopyWith<$Res>? get errorStacktrace;
}

/// @nodoc
class __$$PaginationBatchResponseImplCopyWithImpl<T, $Res>
    extends
        _$PaginationBatchResponseCopyWithImpl<
          T,
          $Res,
          _$PaginationBatchResponseImpl<T>
        >
    implements _$$PaginationBatchResponseImplCopyWith<T, $Res> {
  __$$PaginationBatchResponseImplCopyWithImpl(
    _$PaginationBatchResponseImpl<T> _value,
    $Res Function(_$PaginationBatchResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageItems = null,
    Object? errorStacktrace = freezed,
    Object? totalCount = null,
    Object? cancelled = null,
  }) {
    return _then(
      _$PaginationBatchResponseImpl<T>(
        pageItems:
            null == pageItems
                ? _value._pageItems
                : pageItems // ignore: cast_nullable_to_non_nullable
                    as Map<int, List<T>>,
        errorStacktrace:
            freezed == errorStacktrace
                ? _value.errorStacktrace
                : errorStacktrace // ignore: cast_nullable_to_non_nullable
                    as ErrorStackTrace?,
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int,
        cancelled:
            null == cancelled
                ? _value.cancelled
                : cancelled // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$PaginationBatchResponseImpl<T> extends _PaginationBatchResponse<T> {
  const _$PaginationBatchResponseImpl({
    final Map<int, List<T>> pageItems = const {},
    this.errorStacktrace,
    required this.totalCount,
    required this.cancelled,
  }) : _pageItems = pageItems,
       super._();

  final Map<int, List<T>> _pageItems;
  @override
  @JsonKey()
  Map<int, List<T>> get pageItems {
    if (_pageItems is EqualUnmodifiableMapView) return _pageItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pageItems);
  }

  @override
  final ErrorStackTrace? errorStacktrace;
  @override
  final int totalCount;
  @override
  final bool cancelled;

  @override
  String toString() {
    return 'PaginationBatchResponse<$T>(pageItems: $pageItems, errorStacktrace: $errorStacktrace, totalCount: $totalCount, cancelled: $cancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationBatchResponseImpl<T> &&
            const DeepCollectionEquality().equals(
              other._pageItems,
              _pageItems,
            ) &&
            (identical(other.errorStacktrace, errorStacktrace) ||
                other.errorStacktrace == errorStacktrace) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pageItems),
    errorStacktrace,
    totalCount,
    cancelled,
  );

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationBatchResponseImplCopyWith<T, _$PaginationBatchResponseImpl<T>>
  get copyWith => __$$PaginationBatchResponseImplCopyWithImpl<
    T,
    _$PaginationBatchResponseImpl<T>
  >(this, _$identity);
}

abstract class _PaginationBatchResponse<T> extends PaginationBatchResponse<T> {
  const factory _PaginationBatchResponse({
    final Map<int, List<T>> pageItems,
    final ErrorStackTrace? errorStacktrace,
    required final int totalCount,
    required final bool cancelled,
  }) = _$PaginationBatchResponseImpl<T>;
  const _PaginationBatchResponse._() : super._();

  @override
  Map<int, List<T>> get pageItems;
  @override
  ErrorStackTrace? get errorStacktrace;
  @override
  int get totalCount;
  @override
  bool get cancelled;

  /// Create a copy of PaginationBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationBatchResponseImplCopyWith<T, _$PaginationBatchResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
