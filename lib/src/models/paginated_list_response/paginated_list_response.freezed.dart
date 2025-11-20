// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginatedListResponse<T> {
  List<T> get results => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedListResponseCopyWith<T, PaginatedListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListResponseCopyWith<T, $Res> {
  factory $PaginatedListResponseCopyWith(
    PaginatedListResponse<T> value,
    $Res Function(PaginatedListResponse<T>) then,
  ) = _$PaginatedListResponseCopyWithImpl<T, $Res, PaginatedListResponse<T>>;
  @useResult
  $Res call({List<T> results, int totalCount});
}

/// @nodoc
class _$PaginatedListResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginatedListResponse<T>
>
    implements $PaginatedListResponseCopyWith<T, $Res> {
  _$PaginatedListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            results:
                null == results
                    ? _value.results
                    : results // ignore: cast_nullable_to_non_nullable
                        as List<T>,
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginatedListResponseImplCopyWith<T, $Res>
    implements $PaginatedListResponseCopyWith<T, $Res> {
  factory _$$PaginatedListResponseImplCopyWith(
    _$PaginatedListResponseImpl<T> value,
    $Res Function(_$PaginatedListResponseImpl<T>) then,
  ) = __$$PaginatedListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> results, int totalCount});
}

/// @nodoc
class __$$PaginatedListResponseImplCopyWithImpl<T, $Res>
    extends
        _$PaginatedListResponseCopyWithImpl<
          T,
          $Res,
          _$PaginatedListResponseImpl<T>
        >
    implements _$$PaginatedListResponseImplCopyWith<T, $Res> {
  __$$PaginatedListResponseImplCopyWithImpl(
    _$PaginatedListResponseImpl<T> _value,
    $Res Function(_$PaginatedListResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginatedListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null, Object? totalCount = null}) {
    return _then(
      _$PaginatedListResponseImpl<T>(
        results:
            null == results
                ? _value._results
                : results // ignore: cast_nullable_to_non_nullable
                    as List<T>,
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$PaginatedListResponseImpl<T> extends _PaginatedListResponse<T> {
  const _$PaginatedListResponseImpl({
    required final List<T> results,
    required this.totalCount,
  }) : _results = results,
       super._();

  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'PaginatedListResponse<$T>(results: $results, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedListResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_results),
    totalCount,
  );

  /// Create a copy of PaginatedListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedListResponseImplCopyWith<T, _$PaginatedListResponseImpl<T>>
  get copyWith => __$$PaginatedListResponseImplCopyWithImpl<
    T,
    _$PaginatedListResponseImpl<T>
  >(this, _$identity);
}

abstract class _PaginatedListResponse<T> extends PaginatedListResponse<T> {
  const factory _PaginatedListResponse({
    required final List<T> results,
    required final int totalCount,
  }) = _$PaginatedListResponseImpl<T>;
  const _PaginatedListResponse._() : super._();

  @override
  List<T> get results;
  @override
  int get totalCount;

  /// Create a copy of PaginatedListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedListResponseImplCopyWith<T, _$PaginatedListResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
