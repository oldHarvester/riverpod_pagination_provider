// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaginationStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingBeforeData,
    required TResult Function() errorBeforeData,
    required TResult Function() initialDataLoaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingBeforeData,
    TResult? Function()? errorBeforeData,
    TResult? Function()? initialDataLoaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingBeforeData,
    TResult Function()? errorBeforeData,
    TResult Function()? initialDataLoaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingBeforeDataStatus value) loadingBeforeData,
    required TResult Function(ErrorBeforeDataStatus value) errorBeforeData,
    required TResult Function(InitialDataLoadedStatus value) initialDataLoaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult? Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult? Function(InitialDataLoadedStatus value)? initialDataLoaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult Function(InitialDataLoadedStatus value)? initialDataLoaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStatusCopyWith<$Res> {
  factory $PaginationStatusCopyWith(
    PaginationStatus value,
    $Res Function(PaginationStatus) then,
  ) = _$PaginationStatusCopyWithImpl<$Res, PaginationStatus>;
}

/// @nodoc
class _$PaginationStatusCopyWithImpl<$Res, $Val extends PaginationStatus>
    implements $PaginationStatusCopyWith<$Res> {
  _$PaginationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingBeforeDataStatusImplCopyWith<$Res> {
  factory _$$LoadingBeforeDataStatusImplCopyWith(
    _$LoadingBeforeDataStatusImpl value,
    $Res Function(_$LoadingBeforeDataStatusImpl) then,
  ) = __$$LoadingBeforeDataStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingBeforeDataStatusImplCopyWithImpl<$Res>
    extends _$PaginationStatusCopyWithImpl<$Res, _$LoadingBeforeDataStatusImpl>
    implements _$$LoadingBeforeDataStatusImplCopyWith<$Res> {
  __$$LoadingBeforeDataStatusImplCopyWithImpl(
    _$LoadingBeforeDataStatusImpl _value,
    $Res Function(_$LoadingBeforeDataStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingBeforeDataStatusImpl extends LoadingBeforeDataStatus {
  const _$LoadingBeforeDataStatusImpl() : super._();

  @override
  String toString() {
    return 'PaginationStatus.loadingBeforeData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingBeforeDataStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingBeforeData,
    required TResult Function() errorBeforeData,
    required TResult Function() initialDataLoaded,
  }) {
    return loadingBeforeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingBeforeData,
    TResult? Function()? errorBeforeData,
    TResult? Function()? initialDataLoaded,
  }) {
    return loadingBeforeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingBeforeData,
    TResult Function()? errorBeforeData,
    TResult Function()? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (loadingBeforeData != null) {
      return loadingBeforeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingBeforeDataStatus value) loadingBeforeData,
    required TResult Function(ErrorBeforeDataStatus value) errorBeforeData,
    required TResult Function(InitialDataLoadedStatus value) initialDataLoaded,
  }) {
    return loadingBeforeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult? Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult? Function(InitialDataLoadedStatus value)? initialDataLoaded,
  }) {
    return loadingBeforeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult Function(InitialDataLoadedStatus value)? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (loadingBeforeData != null) {
      return loadingBeforeData(this);
    }
    return orElse();
  }
}

abstract class LoadingBeforeDataStatus extends PaginationStatus {
  const factory LoadingBeforeDataStatus() = _$LoadingBeforeDataStatusImpl;
  const LoadingBeforeDataStatus._() : super._();
}

/// @nodoc
abstract class _$$ErrorBeforeDataStatusImplCopyWith<$Res> {
  factory _$$ErrorBeforeDataStatusImplCopyWith(
    _$ErrorBeforeDataStatusImpl value,
    $Res Function(_$ErrorBeforeDataStatusImpl) then,
  ) = __$$ErrorBeforeDataStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorBeforeDataStatusImplCopyWithImpl<$Res>
    extends _$PaginationStatusCopyWithImpl<$Res, _$ErrorBeforeDataStatusImpl>
    implements _$$ErrorBeforeDataStatusImplCopyWith<$Res> {
  __$$ErrorBeforeDataStatusImplCopyWithImpl(
    _$ErrorBeforeDataStatusImpl _value,
    $Res Function(_$ErrorBeforeDataStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorBeforeDataStatusImpl extends ErrorBeforeDataStatus {
  const _$ErrorBeforeDataStatusImpl() : super._();

  @override
  String toString() {
    return 'PaginationStatus.errorBeforeData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorBeforeDataStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingBeforeData,
    required TResult Function() errorBeforeData,
    required TResult Function() initialDataLoaded,
  }) {
    return errorBeforeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingBeforeData,
    TResult? Function()? errorBeforeData,
    TResult? Function()? initialDataLoaded,
  }) {
    return errorBeforeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingBeforeData,
    TResult Function()? errorBeforeData,
    TResult Function()? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (errorBeforeData != null) {
      return errorBeforeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingBeforeDataStatus value) loadingBeforeData,
    required TResult Function(ErrorBeforeDataStatus value) errorBeforeData,
    required TResult Function(InitialDataLoadedStatus value) initialDataLoaded,
  }) {
    return errorBeforeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult? Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult? Function(InitialDataLoadedStatus value)? initialDataLoaded,
  }) {
    return errorBeforeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult Function(InitialDataLoadedStatus value)? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (errorBeforeData != null) {
      return errorBeforeData(this);
    }
    return orElse();
  }
}

abstract class ErrorBeforeDataStatus extends PaginationStatus {
  const factory ErrorBeforeDataStatus() = _$ErrorBeforeDataStatusImpl;
  const ErrorBeforeDataStatus._() : super._();
}

/// @nodoc
abstract class _$$InitialDataLoadedStatusImplCopyWith<$Res> {
  factory _$$InitialDataLoadedStatusImplCopyWith(
    _$InitialDataLoadedStatusImpl value,
    $Res Function(_$InitialDataLoadedStatusImpl) then,
  ) = __$$InitialDataLoadedStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialDataLoadedStatusImplCopyWithImpl<$Res>
    extends _$PaginationStatusCopyWithImpl<$Res, _$InitialDataLoadedStatusImpl>
    implements _$$InitialDataLoadedStatusImplCopyWith<$Res> {
  __$$InitialDataLoadedStatusImplCopyWithImpl(
    _$InitialDataLoadedStatusImpl _value,
    $Res Function(_$InitialDataLoadedStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialDataLoadedStatusImpl extends InitialDataLoadedStatus {
  const _$InitialDataLoadedStatusImpl() : super._();

  @override
  String toString() {
    return 'PaginationStatus.initialDataLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialDataLoadedStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingBeforeData,
    required TResult Function() errorBeforeData,
    required TResult Function() initialDataLoaded,
  }) {
    return initialDataLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingBeforeData,
    TResult? Function()? errorBeforeData,
    TResult? Function()? initialDataLoaded,
  }) {
    return initialDataLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingBeforeData,
    TResult Function()? errorBeforeData,
    TResult Function()? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (initialDataLoaded != null) {
      return initialDataLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingBeforeDataStatus value) loadingBeforeData,
    required TResult Function(ErrorBeforeDataStatus value) errorBeforeData,
    required TResult Function(InitialDataLoadedStatus value) initialDataLoaded,
  }) {
    return initialDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult? Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult? Function(InitialDataLoadedStatus value)? initialDataLoaded,
  }) {
    return initialDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingBeforeDataStatus value)? loadingBeforeData,
    TResult Function(ErrorBeforeDataStatus value)? errorBeforeData,
    TResult Function(InitialDataLoadedStatus value)? initialDataLoaded,
    required TResult orElse(),
  }) {
    if (initialDataLoaded != null) {
      return initialDataLoaded(this);
    }
    return orElse();
  }
}

abstract class InitialDataLoadedStatus extends PaginationStatus {
  const factory InitialDataLoadedStatus() = _$InitialDataLoadedStatusImpl;
  const InitialDataLoadedStatus._() : super._();
}
