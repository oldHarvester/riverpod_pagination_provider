// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationPageResponse<T> {
  PaginationPageState<T> get page => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  PaginationParams get paginationParams => throw _privateConstructorUsedError;

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationPageResponseCopyWith<T, PaginationPageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationPageResponseCopyWith<T, $Res> {
  factory $PaginationPageResponseCopyWith(
    PaginationPageResponse<T> value,
    $Res Function(PaginationPageResponse<T>) then,
  ) = _$PaginationPageResponseCopyWithImpl<T, $Res, PaginationPageResponse<T>>;
  @useResult
  $Res call({
    PaginationPageState<T> page,
    int totalCount,
    PaginationParams paginationParams,
  });

  $PaginationPageStateCopyWith<T, $Res> get page;
  $PaginationParamsCopyWith<$Res> get paginationParams;
}

/// @nodoc
class _$PaginationPageResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginationPageResponse<T>
>
    implements $PaginationPageResponseCopyWith<T, $Res> {
  _$PaginationPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalCount = null,
    Object? paginationParams = null,
  }) {
    return _then(
      _value.copyWith(
            page:
                null == page
                    ? _value.page
                    : page // ignore: cast_nullable_to_non_nullable
                        as PaginationPageState<T>,
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int,
            paginationParams:
                null == paginationParams
                    ? _value.paginationParams
                    : paginationParams // ignore: cast_nullable_to_non_nullable
                        as PaginationParams,
          )
          as $Val,
    );
  }

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationPageStateCopyWith<T, $Res> get page {
    return $PaginationPageStateCopyWith<T, $Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationParamsCopyWith<$Res> get paginationParams {
    return $PaginationParamsCopyWith<$Res>(_value.paginationParams, (value) {
      return _then(_value.copyWith(paginationParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginationPageResponseImplCopyWith<T, $Res>
    implements $PaginationPageResponseCopyWith<T, $Res> {
  factory _$$PaginationPageResponseImplCopyWith(
    _$PaginationPageResponseImpl<T> value,
    $Res Function(_$PaginationPageResponseImpl<T>) then,
  ) = __$$PaginationPageResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    PaginationPageState<T> page,
    int totalCount,
    PaginationParams paginationParams,
  });

  @override
  $PaginationPageStateCopyWith<T, $Res> get page;
  @override
  $PaginationParamsCopyWith<$Res> get paginationParams;
}

/// @nodoc
class __$$PaginationPageResponseImplCopyWithImpl<T, $Res>
    extends
        _$PaginationPageResponseCopyWithImpl<
          T,
          $Res,
          _$PaginationPageResponseImpl<T>
        >
    implements _$$PaginationPageResponseImplCopyWith<T, $Res> {
  __$$PaginationPageResponseImplCopyWithImpl(
    _$PaginationPageResponseImpl<T> _value,
    $Res Function(_$PaginationPageResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalCount = null,
    Object? paginationParams = null,
  }) {
    return _then(
      _$PaginationPageResponseImpl<T>(
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as PaginationPageState<T>,
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int,
        paginationParams:
            null == paginationParams
                ? _value.paginationParams
                : paginationParams // ignore: cast_nullable_to_non_nullable
                    as PaginationParams,
      ),
    );
  }
}

/// @nodoc

class _$PaginationPageResponseImpl<T> implements _PaginationPageResponse<T> {
  const _$PaginationPageResponseImpl({
    required this.page,
    required this.totalCount,
    required this.paginationParams,
  });

  @override
  final PaginationPageState<T> page;
  @override
  final int totalCount;
  @override
  final PaginationParams paginationParams;

  @override
  String toString() {
    return 'PaginationPageResponse<$T>(page: $page, totalCount: $totalCount, paginationParams: $paginationParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationPageResponseImpl<T> &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.paginationParams, paginationParams) ||
                other.paginationParams == paginationParams));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, totalCount, paginationParams);

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationPageResponseImplCopyWith<T, _$PaginationPageResponseImpl<T>>
  get copyWith => __$$PaginationPageResponseImplCopyWithImpl<
    T,
    _$PaginationPageResponseImpl<T>
  >(this, _$identity);
}

abstract class _PaginationPageResponse<T> implements PaginationPageResponse<T> {
  const factory _PaginationPageResponse({
    required final PaginationPageState<T> page,
    required final int totalCount,
    required final PaginationParams paginationParams,
  }) = _$PaginationPageResponseImpl<T>;

  @override
  PaginationPageState<T> get page;
  @override
  int get totalCount;
  @override
  PaginationParams get paginationParams;

  /// Create a copy of PaginationPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationPageResponseImplCopyWith<T, _$PaginationPageResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
