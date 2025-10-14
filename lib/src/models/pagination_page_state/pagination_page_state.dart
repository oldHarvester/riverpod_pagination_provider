import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_pagination_provider/src/models/error_stacktrace/error_stacktrace.dart';

part 'pagination_page_state.freezed.dart';

@Freezed(
  fromJson: false,
  toJson: false,
  genericArgumentFactories: true,
  makeCollectionsUnmodifiable: true,
)
abstract class PaginationPageState<T> with _$PaginationPageState<T> {
  const PaginationPageState._();

  const factory PaginationPageState({
    @Default([]) List<T> items,
    ErrorStackTrace? errorStackTrace,
    @Default(true) bool isLoading,
    @Default(0) int updateCount,
  }) = _PaginationPageState<T>;

  bool get hasError => errorStackTrace != null;

  bool get isEmpty => items.isEmpty;

  WhenValue when<WhenValue>(
    WhenValue Function() loading,
    WhenValue Function(PaginationPageState<T> state) data,
    WhenValue Function(PaginationPageState<T> state)? empty,
    WhenValue Function(Object error, StackTrace stackTrace) error,
  ) {
    final errorStackTrace = this.errorStackTrace;
    if (isLoading) {
      return loading();
    } else if (errorStackTrace != null) {
      return error(errorStackTrace.error, errorStackTrace.stackTrace);
    } else {
      if (isEmpty) {
        return empty?.call(this) ?? data(this);
      }
      return data(this);
    }
  }

  WhenValue? whenOrNull<WhenValue>(
    WhenValue? Function()? loading,
    WhenValue? Function(PaginationPageState<T> state)? data,
    WhenValue Function(PaginationPageState<T> state)? empty,
    WhenValue? Function(Object error, StackTrace stackTrace)? error,
  ) {
    final errorStackTrace = this.errorStackTrace;
    if (isLoading) {
      return loading?.call();
    } else if (errorStackTrace != null) {
      return error?.call(errorStackTrace.error, errorStackTrace.stackTrace);
    } else {
      if (isEmpty) {
        return empty?.call(this) ?? data?.call(this);
      }
      return data?.call(this);
    }
  }
}
