// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_relative_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationRelativeIndex {
  int get page => throw _privateConstructorUsedError;
  double get pageProgress => throw _privateConstructorUsedError;
  double get totalProgress => throw _privateConstructorUsedError;
  int get relativeIndex => throw _privateConstructorUsedError;
  int get absoluteIndex => throw _privateConstructorUsedError;

  /// Create a copy of PaginationRelativeIndex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationRelativeIndexCopyWith<PaginationRelativeIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationRelativeIndexCopyWith<$Res> {
  factory $PaginationRelativeIndexCopyWith(
    PaginationRelativeIndex value,
    $Res Function(PaginationRelativeIndex) then,
  ) = _$PaginationRelativeIndexCopyWithImpl<$Res, PaginationRelativeIndex>;
  @useResult
  $Res call({
    int page,
    double pageProgress,
    double totalProgress,
    int relativeIndex,
    int absoluteIndex,
  });
}

/// @nodoc
class _$PaginationRelativeIndexCopyWithImpl<
  $Res,
  $Val extends PaginationRelativeIndex
>
    implements $PaginationRelativeIndexCopyWith<$Res> {
  _$PaginationRelativeIndexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationRelativeIndex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageProgress = null,
    Object? totalProgress = null,
    Object? relativeIndex = null,
    Object? absoluteIndex = null,
  }) {
    return _then(
      _value.copyWith(
            page:
                null == page
                    ? _value.page
                    : page // ignore: cast_nullable_to_non_nullable
                        as int,
            pageProgress:
                null == pageProgress
                    ? _value.pageProgress
                    : pageProgress // ignore: cast_nullable_to_non_nullable
                        as double,
            totalProgress:
                null == totalProgress
                    ? _value.totalProgress
                    : totalProgress // ignore: cast_nullable_to_non_nullable
                        as double,
            relativeIndex:
                null == relativeIndex
                    ? _value.relativeIndex
                    : relativeIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            absoluteIndex:
                null == absoluteIndex
                    ? _value.absoluteIndex
                    : absoluteIndex // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationRelativeIndexImplCopyWith<$Res>
    implements $PaginationRelativeIndexCopyWith<$Res> {
  factory _$$PaginationRelativeIndexImplCopyWith(
    _$PaginationRelativeIndexImpl value,
    $Res Function(_$PaginationRelativeIndexImpl) then,
  ) = __$$PaginationRelativeIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    double pageProgress,
    double totalProgress,
    int relativeIndex,
    int absoluteIndex,
  });
}

/// @nodoc
class __$$PaginationRelativeIndexImplCopyWithImpl<$Res>
    extends
        _$PaginationRelativeIndexCopyWithImpl<
          $Res,
          _$PaginationRelativeIndexImpl
        >
    implements _$$PaginationRelativeIndexImplCopyWith<$Res> {
  __$$PaginationRelativeIndexImplCopyWithImpl(
    _$PaginationRelativeIndexImpl _value,
    $Res Function(_$PaginationRelativeIndexImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationRelativeIndex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageProgress = null,
    Object? totalProgress = null,
    Object? relativeIndex = null,
    Object? absoluteIndex = null,
  }) {
    return _then(
      _$PaginationRelativeIndexImpl(
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as int,
        pageProgress:
            null == pageProgress
                ? _value.pageProgress
                : pageProgress // ignore: cast_nullable_to_non_nullable
                    as double,
        totalProgress:
            null == totalProgress
                ? _value.totalProgress
                : totalProgress // ignore: cast_nullable_to_non_nullable
                    as double,
        relativeIndex:
            null == relativeIndex
                ? _value.relativeIndex
                : relativeIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        absoluteIndex:
            null == absoluteIndex
                ? _value.absoluteIndex
                : absoluteIndex // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$PaginationRelativeIndexImpl implements _PaginationRelativeIndex {
  const _$PaginationRelativeIndexImpl({
    required this.page,
    required this.pageProgress,
    required this.totalProgress,
    required this.relativeIndex,
    required this.absoluteIndex,
  });

  @override
  final int page;
  @override
  final double pageProgress;
  @override
  final double totalProgress;
  @override
  final int relativeIndex;
  @override
  final int absoluteIndex;

  @override
  String toString() {
    return 'PaginationRelativeIndex(page: $page, pageProgress: $pageProgress, totalProgress: $totalProgress, relativeIndex: $relativeIndex, absoluteIndex: $absoluteIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationRelativeIndexImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageProgress, pageProgress) ||
                other.pageProgress == pageProgress) &&
            (identical(other.totalProgress, totalProgress) ||
                other.totalProgress == totalProgress) &&
            (identical(other.relativeIndex, relativeIndex) ||
                other.relativeIndex == relativeIndex) &&
            (identical(other.absoluteIndex, absoluteIndex) ||
                other.absoluteIndex == absoluteIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageProgress,
    totalProgress,
    relativeIndex,
    absoluteIndex,
  );

  /// Create a copy of PaginationRelativeIndex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationRelativeIndexImplCopyWith<_$PaginationRelativeIndexImpl>
  get copyWith => __$$PaginationRelativeIndexImplCopyWithImpl<
    _$PaginationRelativeIndexImpl
  >(this, _$identity);
}

abstract class _PaginationRelativeIndex implements PaginationRelativeIndex {
  const factory _PaginationRelativeIndex({
    required final int page,
    required final double pageProgress,
    required final double totalProgress,
    required final int relativeIndex,
    required final int absoluteIndex,
  }) = _$PaginationRelativeIndexImpl;

  @override
  int get page;
  @override
  double get pageProgress;
  @override
  double get totalProgress;
  @override
  int get relativeIndex;
  @override
  int get absoluteIndex;

  /// Create a copy of PaginationRelativeIndex
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationRelativeIndexImplCopyWith<_$PaginationRelativeIndexImpl>
  get copyWith => throw _privateConstructorUsedError;
}
